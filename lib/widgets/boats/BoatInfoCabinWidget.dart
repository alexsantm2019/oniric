import 'package:flutter/material.dart';
import 'package:oniric/models/Cabins.dart';
import '../../constants.dart';

class BoatInfoCabinWidget extends StatelessWidget {
  final Cabins cabin;

  BoatInfoCabinWidget({
    Key key,
    @required this.cabin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding:
          EdgeInsets.only(top: 1.00, bottom: 1.00, left: 25.00, right: 25.00),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 10.0,
                  height: 60.0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 6.0,
                      backgroundColor:
                          cabin.decStatus == 1 ? Colors.green : Colors.red,
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(left: 10.00),
                width: 350.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(cabin.cabName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold)),
                    Text(cabin.decName != '' ? cabin.decName : "No description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.normal)),
                  ],
                ),
              ),
            ],
          ),
          new Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
