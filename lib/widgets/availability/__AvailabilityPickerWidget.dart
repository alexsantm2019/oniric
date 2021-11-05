import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:intl/intl.dart';
import 'package:oniric/widgets/availability/AvailabilityWidget.dart';

class AvailabilityPickerWidget extends StatefulWidget {
  @override
  _AvailabilityPickerWidget createState() => _AvailabilityPickerWidget();
}

GlobalKey<FormState> myFormKey = new GlobalKey();

class _AvailabilityPickerWidget extends State<AvailabilityPickerWidget> {
  DateTimeRange myDateRange;
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select range"),
      ),
      body: SafeArea(
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              SafeArea(
                child: DateRangeField(
                    firstDate: DateTime(1990),
                    enabled: true,
                    initialValue: DateTimeRange(
                        start: DateTime.now(),
                        end: DateTime.now().add(Duration(days: 5))),
                    decoration: InputDecoration(
                      labelText: 'Date Range',
                      prefixIcon: Icon(Icons.date_range),
                      hintText: 'Please select a start and end date',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value.start.isBefore(DateTime.now())) {
                        return 'Please enter a later start date';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        myDateRange = value;
                      });
                    }),
              ),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: _submitForm,
              ),
              if (myDateRange != null)
                Text("Saved value is: ${myDateRange.toString()}")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: DateRangeField(
            firstDate: DateTime(1990),
            enabled: true,
            initialValue: DateTimeRange(
                start: DateTime.now(),
                end: DateTime.now().add(Duration(days: 5))),
            decoration: InputDecoration(
              labelText: 'Date Range',
              prefixIcon: Icon(Icons.date_range),
              hintText: 'Please select a start and end date',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value.start.isBefore(DateTime.now())) {
                return 'Please enter a later start date';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                myDateRange = value;
              });
            }),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _submitForm() {
    final FormState form = myFormKey.currentState;
    form.save();

    String start = new DateFormat("yyyy-MM-dd").format(myDateRange.start);
    String end = new DateFormat("yyyy-MM-dd").format(myDateRange.end);

    //String duration = new DateFormat("yyyy-MM-dd").format(myDateRange);
    //print('Convertida: ${convertedDate}');
    print('Fecha de inicio: $start');
    print('Fecha de fin: $end');
    print('Duration: ${myDateRange.duration.toString()}');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      //return AvailabilityWidget(start: start, end: end);
      return AvailabilityWidget();
    }));
    // widget.trip.startDate = _startDate;
    // widget.trip.endDate = _endDate;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => NewTripBudgetView(trip: widget.trip)),
    // );
  }
}
