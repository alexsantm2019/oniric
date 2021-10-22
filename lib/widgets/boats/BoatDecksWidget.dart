import 'package:flutter/material.dart';
import 'package:oniric/models/Boats.dart';
import '../../constants.dart';

class BoatDecksWidget extends StatelessWidget {
  final Boats boatInfo;

  BoatDecksWidget({this.boatInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 335,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white.withAlpha(200),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Decks'),
              //Text(boatInfo.toString(), style: cardStatusTitleStyle)
            ],
          ),
        ));
  }
}
