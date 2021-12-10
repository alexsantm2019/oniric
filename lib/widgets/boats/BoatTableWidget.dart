import 'package:flutter/material.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/models/Boats.dart';
import 'package:oniric/widgets/boats/BoatImagesWidget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BoatTableWidget extends StatelessWidget with Helper {
  final Boats boatInfo;

  BoatTableWidget({this.boatInfo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
        // Image(image: AssetImage('images/defaultBoat.jpg'), fit: BoxFit.cover),
        BoatImagesWidget(vslId: this.boatInfo.vslId),
        AnimationLimiter(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Table(
                defaultColumnWidth: IntrinsicColumnWidth(),
                columnWidths: {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(250)
                },
                border: TableBorder.all(
                    color: Colors.grey.shade100,
                    style: BorderStyle.solid,
                    width: 1),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Name',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslName != null ? boatInfo.vslName : "No Name added"}',
                          style: contentTableStyle)
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Alias',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslAlias != null ? boatInfo.vslAlias : "No alias added"}',
                          style: contentTableStyle)
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Web site',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      boatInfo.vslWebsite != null
                          ? FlatButton(
                              onPressed: () => _launchURL(
                                  context, boatInfo.vslWebsite.toString()),
                              child: Text(boatInfo.vslWebsite,
                                  style: TextStyle(
                                      fontSize: 11.0, color: Colors.blue)),
                            )
                          : Text("No web site added", style: contentTableStyle)
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Description',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslDescription != null ? boatInfo.vslDescription : "No description"}')
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Capacity',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslCapacity.toString() ?? "No capacity added"}')
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Model',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslModel != null ? boatInfo.vslModel : "No model added"}')
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Year',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslYear != null ? boatInfo.vslYear : "No year added"}')
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Power (HP)',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslPower != null ? boatInfo.vslPower : "No information added"}')
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Speed (KN)',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslSpeed != null ? boatInfo.vslSpeed : "No information added"}')
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Length (m)',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslLength != null ? boatInfo.vslLength.toString() : "No information added"}')
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Width (m)',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: hexStringToColor(boatInfo.vslColor != null
                                  ? boatInfo.vslColor
                                  : MAIN_COLOR_ORANGE)))
                    ]),
                    Column(children: [
                      Text(
                          '${boatInfo.vslWidth != null ? boatInfo.vslWidth.toString() : "No information added"}')
                    ]),
                  ]),
                ],
              ),
            ),
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  color: hexStringToColor(boatInfo.vslColor != null
                      ? boatInfo.vslColor
                      : MAIN_COLOR_ORANGE),
                  width: 1),
            ),
            elevation: 10,
          ),
        )
      ]))),
    );
  }

  _launchURL(context, String url) async {
    await launch(url);
    if (!url.contains('http')) url = 'http://$url';
    await launch(url);
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: new Text('Could not launch $url')));
    //   return;
    // }
  }
}
