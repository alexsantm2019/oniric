import 'package:flutter/material.dart';
import 'package:oniric/models/Service.dart';
import '../../constants.dart';

class BoatInfoServicesWidget extends StatelessWidget {
  final Service service;

  BoatInfoServicesWidget({
    Key key,
    @required this.service,
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
                      backgroundColor: Colors.red,
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(left: 10.00),
                width: 350.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(service.serName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold)),
                    Text(
                        service.serDescription != ''
                            ? service.serDescription
                            : "No description",
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
