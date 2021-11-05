import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:oniric/mixins/Helper.dart';

class AvailabilityBoxesWidget extends StatelessWidget with Helper {
  final String num;
  final Color color;
  final String description;

  AvailabilityBoxesWidget(
      {Key key, @required this.num, this.color, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white.withAlpha(200),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(55.0),
        ),
        color: color,
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 3.0),
            Align(
              alignment: Alignment.bottomCenter,
            ),
            SizedBox(height: 3.0),
            Text(num, style: cardStatusTitleStyle),
          ],
        ),
      ),
    );
  }
}
