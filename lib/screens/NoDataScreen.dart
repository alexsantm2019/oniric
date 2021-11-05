import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oniric/mixins/Helper.dart';
import '../constants.dart';

class NoDataScreen extends StatelessWidget with Helper {
  final String title;
  final String subTitle;

  NoDataScreen({Key key, @required this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: new Icon(
              FontAwesomeIcons.calendar,
              size: 45,
            ),
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 45,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey)),
          Text(subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey)),
        ],
      ),
    );
  }
}
