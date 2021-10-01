import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  // final Function onTap;
  // final Function onSwipe;
  // final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    // var imageCountry = country.ISO2;
    return GestureDetector(
      onLongPress: () {
        // onLongPress(country.slug);
      },
      onTap: () {
        // onTap(country);
      },
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue[300], width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.blue[100],
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 30),
                Text("Contact"),
              ],
            ),
          )),
      //),
    );
  }
}
