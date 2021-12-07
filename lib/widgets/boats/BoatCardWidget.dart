import 'package:flutter/material.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/models/Boats.dart';
import '../../constants.dart';
import 'dart:math';

class BoatCardWidget extends StatelessWidget with Helper {
  final Boats boat;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  dynamic listBoatsImages = [
    "images/defaultBoats/defaultBoat1.jpg",
    "images/defaultBoats/defaultBoat2.jpg",
    "images/defaultBoats/defaultBoat3.jpg",
    "images/defaultBoats/defaultBoat4.jpg",
    "images/defaultBoats/defaultBoat5.jpg",
    "images/defaultBoats/defaultBoat6.jpg",
    "images/defaultBoats/defaultBoat7.jpg",
    "images/defaultBoats/defaultBoat8.jpg",
    "images/defaultBoats/defaultBoat9.jpg",
    "images/defaultBoats/defaultBoat10.jpg",
    "images/defaultBoats/defaultBoat11.jpg",
    "images/defaultBoats/defaultBoat12.jpg",
  ];
  Random rnd;

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
          Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              height: 80,
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
                  //image: AssetImage('images/defaultBoat.jpg'),
                  image: AssetImage(randomImg()),
                ),
              ),
            ),
          ),
        ],
      ),
      //),
    );
  }

  String randomImg() {
    int min = 0;
    int max = listBoatsImages.length - 1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String imageName = listBoatsImages[r].toString();
    return imageName;
    // return Image.asset(
    //   image_name,
    //   fit: BoxFit.cover,
    // );
  }
}
