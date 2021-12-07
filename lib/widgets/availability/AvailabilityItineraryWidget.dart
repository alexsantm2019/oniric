import 'package:flutter/material.dart';
import 'package:oniric/models/Itinerary.dart';
import '../../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvailabilityItineraryWidget extends StatelessWidget {
  final Itinerary itineraryInfo;

  AvailabilityItineraryWidget({this.itineraryInfo});

  get icons => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20.00),
          color: Colors.orange.shade300,
          //width: 415.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.keyboard_backspace_sharp,
                          color: Colors.white),
                    )),
              ),
              Expanded(
                  child: Center(
                child: Text("Itinerary",
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              )),
              Expanded(
                  child: Center(
                child: Text(""),
              )),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10.00),
          color: Colors.orange.shade500,
          //width: 415.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(itineraryInfo.cruName,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                child: Text(itineraryInfo.itiName,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                child: Text(
                    "Code: ${itineraryInfo.itiCode} | Night: ${itineraryInfo.itiNights}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.00),
          color: Colors.orange.shade700,
          //width: 415.0,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Center(
                child: Text(
                    "${itineraryInfo.Type} | ${itineraryInfo.Difficulty}",
                    style: TextStyle(color: Colors.white)),
              )),
            ],
          ),
        ),
        Column(children: <Widget>[
          DataTable(
            columnSpacing: 25,
            columns: [
              DataColumn(
                label: Text("Day"),
                numeric: false,
                tooltip: "",
              ),
              DataColumn(
                label: Text("Site"),
                numeric: false,
                tooltip: "",
              ),
              DataColumn(
                label: Text("Activities"),
                numeric: false,
                tooltip: "",
              ),
            ],
            rows: itineraryInfo.summary
                .map(
                  (item) => DataRow(cells: [
                    DataCell(
                      Text(item['DayShort'].toString()),
                    ),
                    DataCell(Text(
                        "${item['Meridian'].toString()} - ${item['sitName'].toString()} (${item['plaName'].toString()}) ")),
                    DataCell(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (var it in item['activities'])
                            Flexible(
                              child: Text(it['activityName'].toString(),
                                  style: contentActivitiesDataTable),
                            ),
                        ],
                      ),
                    ),
                  ]),
                )
                .toList(),
          )
        ])
      ]))),
    );
  }

  IconData getFontAwesomeIcon(String iconName) {
    if (iconName == '') {
      return FontAwesomeIcons.questionCircle;
    }

    var list = iconName.split(' ');
    if (list.length == 1) {
      iconName = list[0];
    }
    if (list.length >= 2) {
      iconName = list[1];
    }

    iconName = iconName.replaceAll('fa-', '');
    iconName = iconName.replaceAll('-', '');

    final filteredIcons = icons
        .where(
            (icon) => icon.title.toLowerCase().contains(iconName.toLowerCase()))
        .toList();
    if (filteredIcons.isEmpty) {
      return FontAwesomeIcons.questionCircle;
    } else {
      return filteredIcons[0].iconData;
    }
  }
}
