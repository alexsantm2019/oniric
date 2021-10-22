import 'package:flutter/material.dart';
import 'package:oniric/models/Boats.dart';
import '../../constants.dart';

class BoatCardWidget extends StatelessWidget {
  final Boats boat;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  BoatCardWidget({
    Key key,
    @required this.boat,
    this.onTap,
    this.onSwipe,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageCountry = boat.vslName;
    return GestureDetector(
      onLongPress: () {
        onLongPress(boat.vslName);
      },
      onTap: () {
        onTap(boat);
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
                // Image.network(
                //     "https://www.countryflags.io/$imageCountry/flat/32.png"),
                SizedBox(width: 30),
                Text(boat.vslName, style: fromTextStyle),
                Text(boat.vslAlias, style: fromTextStyle),
              ],
            ),
          )),
      //),
    );
  }
}
