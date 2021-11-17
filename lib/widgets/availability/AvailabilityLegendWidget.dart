import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:oniric/mixins/Helper.dart';

class AvailabilityLegendWidget extends StatelessWidget with Helper {
  AvailabilityLegendWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
          ),
          color: Colors.green,
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 1.0),
              Align(
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(height: 1.0),
              Center(
                  child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text("Available", style: cardStatusLegendStyle),
              )),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
          ),
          color: Colors.yellow.shade700,
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 1.0),
              Align(
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(height: 1.0),
              Center(
                  child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text("Blocked", style: cardStatusLegendStyle),
              )),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
          ),
          color: Colors.pink.shade400,
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 1.0),
              Align(
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(height: 1.0),
              Center(
                  child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text("Confirmed", style: cardStatusLegendStyle),
              )),
            ],
          ),
        ),
      ],
    ));
  }
}
