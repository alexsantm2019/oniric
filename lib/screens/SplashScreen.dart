import 'package:flutter/material.dart';
import 'package:oniric/screens/HomeScreen.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:splashscreen/splashscreen.dart';
import '../constants.dart';

class Splash extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      // backgroundColor: Color.fromRGBO(4, 6, 28, 0.9),
      backgroundColor: hexStringToColor(MAIN_COLOR_ORANGE),
      //backgroundColor: Colors.white,
      navigateAfterSeconds: new HomeScreen(),
      title: new Text(
        'Andean Travel Company',
        style: titleSplashStyle,
        textScaleFactor: 2,
      ),
      image: Image(
        image: AssetImage('images/logo-atc.png'),
      ),
      loadingText: Text("Loading", style: titleSplashStyle),
      photoSize: 150.0,
      loaderColor: Colors.blue,
    );
  }
}
