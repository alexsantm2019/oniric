import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oniric/screens/HomeScreen.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:splashscreen/splashscreen.dart';
import '../constants.dart';
import 'WidgetRingAnimator.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  initScreen(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          //backgroundColor: const Color(0xFF0B0C0B),
          backgroundColor: Colors.orange,
          body: Stack(
            children: <Widget>[
              Center(
                  child: WidgetRingAnimator(
                size: 240,
                ringIcons: const [
                  'images/animations/store.png',
                  'images/animations/product.png',
                  'images/animations/cart.png',
                  'images/animations/rupee.png',
                  'images/animations/delivery.png',
                ],
                ringIconsSize: 3,
                ringIconsColor: Colors.white,
                ringAnimation: Curves.linear,
                ringColor: Colors.white,
                reverse: false,
                ringAnimationInSeconds: 10,
                child: Container(
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'images/logo-atc.png',
                        //color: Colors.green,
                        height: 65,
                      ),
                      radius: 45.0,
                    ),
                  ),
                ),
              )),
              Center(
                child: AvatarGlow(
                  glowColor: Colors.blue,
                  endRadius: 90.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    // Replace this child with your own
                    elevation: 8.0,
                    shape: CircleBorder(),
                    // child: CircleAvatar(
                    //   backgroundColor: Colors.grey[100],
                    //   child: Image.asset(
                    //     'images/logo-atc.png',
                    //     height: 65,
                    //   ),
                    //   radius: 45.0,
                    // ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
