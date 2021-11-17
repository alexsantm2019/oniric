import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';
import 'package:oniric/models/Availability.dart';
import 'package:oniric/screens/NoDataScreen.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/availability/AvailabilityCardWidget.dart';
import 'package:intl/intl.dart';
import 'package:oniric/widgets/availability/AvailabilityLegendWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _loadDateFromPreferences();
    // if (start == null && end == null) {
    //   _setInitialDates();
    // }
    //_availabilityList = _services.getAvailability(start, end);
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

                  return Column(
                    children: <Widget>[
                      Container(
                        // decoration: new BoxDecoration(
                        //     gradient: new LinearGradient(
                        //   begin: FractionalOffset.topCenter,
                        //   end: FractionalOffset.bottomCenter,
                        //   colors: [
                        //     const Color.fromARGB(255, 253, 72, 72),
                        //     const Color.fromARGB(255, 87, 97, 249),
                        //   ],
                        //   stops: [0.0, 1.0],
                        // )),
                        //height: .0,
                        child: Center(
                          //children: <Widget>[
                          child: Container(
                              padding: EdgeInsets.all(2.0),
                              //width: 400.0,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    AvailabilityLegendWidget()
                                  ])),
                          //],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        // decoration: new BoxDecoration(
                        //     gradient: new LinearGradient(
                        //   begin: FractionalOffset.topCenter,
                        //   end: FractionalOffset.bottomCenter,
                        //   colors: [
                        //     const Color.fromARGB(255, 253, 72, 72),
                        //     const Color.fromARGB(255, 87, 97, 249),
                        //   ],
                        //   stops: [0.0, 1.0],
                        // )),
                        child: ListView.builder(
                            itemCount: availability.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AvailabilityCardWidget(
                                  availability: availability[index]);
                            }),
                      )),
                    ],
                  );
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

  void _loadDateFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    String newStart = new DateFormat("yyyy-MM-dd").format(DateTime.now());
    String newEnd = new DateFormat("yyyy-MM-dd")
        .format(DateTime.now().add(Duration(days: 28)));

    var startFromPref = "";
    var endFromPref = "";

    startFromPref = prefs.getString('start');
    endFromPref = prefs.getString('end');

    if (startFromPref == null && endFromPref == null) {
      startFromPref = newStart;
      endFromPref = newEnd;
    }
    setState(() {
      start = startFromPref;
      end = endFromPref;
      _availabilityList = _services.getAvailability(start, end);
    });
  }

  void _formatRangeDate() async {
    final prefs = await SharedPreferences.getInstance();
    String startDateFromRange =
        new DateFormat("yyyy-MM-dd").format(myDateRange.start);
    String endDateFromRange =
        new DateFormat("yyyy-MM-dd").format(myDateRange.end);

    var startDate = "";
    var endDate = "";
    //Seteo SharedPreferences:
    if (startDateFromRange != null && endDateFromRange != null) {
      prefs.setString('start', startDateFromRange);
      prefs.setString('end', endDateFromRange);

      startDate = prefs.getString('start') ?? startDateFromRange;
      endDate = prefs.getString('end') ?? endDateFromRange;
    } else {
      String newStart = new DateFormat("yyyy-MM-dd").format(DateTime.now());
      String newEnd = new DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(Duration(days: 28)));

      startDate = newStart;
      endDate = newEnd;
    }

    setState(() {
      start = startDate;
      end = endDate;
      _availabilityList = _services.getAvailability(start, end);
    });
  }

  // void _setInitialDates() {
  //   String newStart = new DateFormat("yyyy-MM-dd").format(DateTime.now());
  //   String newEnd = new DateFormat("yyyy-MM-dd")
  //       .format(DateTime.now().add(Duration(days: 28)));
  //   setState(() {
  //     start = newStart;
  //     end = newEnd;
  //     _availabilityList = _services.getAvailability(start, end);
  //   });
  // }
}
