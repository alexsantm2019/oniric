import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';
import 'package:oniric/models/Availability.dart';
import 'package:oniric/screens/NoDataScreen.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/availability/AvailabilityCardWidget.dart';
import 'package:intl/intl.dart';

class AvailabilityWidget extends StatefulWidget {
  @override
  _AvailabilityWidget createState() => _AvailabilityWidget();
}

class _AvailabilityWidget extends State<AvailabilityWidget> {
  DateTimeRange myDateRange;
  String start;
  String end;
  Future<List<Availability>> _availabilityList;
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
    if (start == null && end == null) {
      _setInitialDates();
    }
    _availabilityList = _services.getAvailability(start, end);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Availability>>(
            future: _availabilityList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR: ${snapshot.error}"),
                );
              } else {
                if (snapshot.hasData && snapshot.data.isNotEmpty) {
                  List<Availability> availability = snapshot.data;
                  return ListView.builder(
                      itemCount: availability.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AvailabilityCardWidget(
                            availability: availability[index]);
                      });
                } else
                  return Center(
                    child: NoDataScreen(
                        title: "No Availability",
                        subTitle: "Try with different dates"),
                  );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },

          child: DateRangeField(
              firstDate: DateTime(2021),
              enabled: true,
              initialValue: DateTimeRange(
                  // start: DateTime.now(),
                  // end: DateTime.now().add(Duration(days: 5))),
                  start: DateTime.now().add(Duration(days: 60)),
                  end: DateTime.now().add(Duration(days: 95))),
              decoration: InputDecoration(
                labelText: 'Date Range',
                icon: new Icon(
                  Icons.date_range,
                  color: Colors.white,
                ),
                hintText: 'Please select a start and end date',
                //border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.start.isBefore(DateTime.now())) {
                  return 'Please enter a later start date';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  myDateRange = value;
                });
                _formatRangeDate();
              }),
          // onSaved: (value) {
          //   setState(() {
          //     print("Enviando informacion: $value");
          //     myDateRange = value;
          //     _submitForm();
          //   });
          // }),
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange.shade700,
        ),
      ),
    );
  }

  void _formatRangeDate() {
    String startDate = new DateFormat("yyyy-MM-dd").format(myDateRange.start);
    String endDate = new DateFormat("yyyy-MM-dd").format(myDateRange.end);
    setState(() {
      start = startDate;
      end = endDate;
      _availabilityList = _services.getAvailability(start, end);
    });
  }

  void _setInitialDates() {
    String newStart = new DateFormat("yyyy-MM-dd").format(DateTime.now());
    String newEnd = new DateFormat("yyyy-MM-dd")
        .format(DateTime.now().add(Duration(days: 28)));
    setState(() {
      start = newStart;
      end = newEnd;
      _availabilityList = _services.getAvailability(start, end);
    });
  }
}
