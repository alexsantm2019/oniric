import 'package:flutter/material.dart';
import 'package:oniric/mixins/Helper.dart';
import '../constants.dart';

class PopupScreen extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.orange, // Set border color
              width: 1.5), // Set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
          ] // Make rounded corner of border
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListBody(
            children: <Widget>[
              Text(
                  "* Check availability in 'Availability' section, choosing date range by clicking on :",
                  style: popupStyle,
                  textAlign: TextAlign.start),
              Image.asset('images/range.jpg', height: 35),
              Text("* Review the activities of each itinerary by clicking on",
                  style: popupStyle, textAlign: TextAlign.start),
              Image.asset(
                'images/itinerary.jpg',
                height: 35,
              ),
              Text(
                  "* You can ask for more details of the departure, by clicking on",
                  style: popupStyle,
                  textAlign: TextAlign.start),
              Image.asset(
                'images/whatsapp.png',
                height: 25,
              ),
              Text(
                  "* Check the list of boats and access the information of each one in the 'Boats' section.",
                  style: popupStyle,
                  textAlign: TextAlign.start),
              Text(
                  "* Do you have any questions? Complete the form in the 'Contact' section.",
                  style: popupStyle,
                  textAlign: TextAlign.start)
            ],
          )
        ],
      ),
    );
  }
}
