import 'package:flutter/material.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/models/Boats.dart';
import '../../constants.dart';

class BoatCardWidget extends StatelessWidget with Helper {
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
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          new Card(
            child: AnimatedContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              height: 80,
              duration: const Duration(seconds: 10),
              curve: Curves.fastOutSlowIn,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(boat.vslName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        color: Colors.white)),
              ),
              decoration: new BoxDecoration(
                color: hexStringToColor(
                    boat.vslColor != null ? boat.vslColor : MAIN_COLOR_ORANGE),
                image: new DecorationImage(
                  fit: BoxFit.fitWidth,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  image: AssetImage('images/defaultBoat.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
      //),
    );
  }
}
