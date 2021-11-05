import 'package:flutter/material.dart';
import 'package:oniric/models/Boats.dart';
import '../../constants.dart';

class BoatTableWidget extends StatelessWidget {
  final Boats boatInfo;

  BoatTableWidget({this.boatInfo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
        Image(image: AssetImage('images/defaultBoat.jpg'), fit: BoxFit.cover),
        Container(
          margin: EdgeInsets.all(20),
          child: Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            columnWidths: {0: FixedColumnWidth(100), 1: FixedColumnWidth(250)},
            border: TableBorder.all(
                color: Colors.grey, style: BorderStyle.solid, width: 2),
            children: [
              TableRow(children: [
                Column(children: [Text('Name', style: titleTableStyle)]),
                Column(children: [
                  Text(
                      '${boatInfo.vslName != null ? boatInfo.vslName : "No Name"}',
                      style: contentTableStyle)
                ]),
              ]),
              TableRow(children: [
                Column(children: [Text('Description', style: titleTableStyle)]),
                Column(children: [
                  Text(
                      '${boatInfo.vslDescription != null ? boatInfo.vslDescription : "No description"}')
                ]),
              ]),
            ],
          ),
        ),
      ]))),
    );
  }
}
