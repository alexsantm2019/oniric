import 'package:flutter/material.dart';
import 'package:oniric/screens/NoDataScreen.dart';
import 'package:oniric/widgets/availability/AvailabilityWidget.dart';
import 'package:oniric/widgets/boats/BoatsMasterWidget.dart';
import 'package:oniric/widgets/contact/ContactWidget.dart';
import 'package:oniric/mixins/Helper.dart';
import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'PopupScreen.dart';

class HomeScreen extends StatelessWidget with Helper {
  static String routeName;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    Future.delayed(Duration.zero, () => showAlert(context));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/logo-atc-white.png',
                      width: 133, height: 55, fit: BoxFit.fill),
                )
              ],
            ),
            backgroundColor: hexStringToColor(MAIN_COLOR_ORANGE),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 1,
              //indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              indicator: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.redAccent, Colors.orangeAccent]),
                  borderRadius: BorderRadius.circular(5),
                  color: hexStringToColor(MAIN_COLOR_ORANGE)),
              tabs: [
                Tab(text: "Availability", icon: Icon(Icons.checklist_sharp)),
                Tab(text: 'Boats', icon: Icon(Icons.directions_boat_filled)),
                Tab(text: 'Contact', icon: Icon(Icons.email)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AvailabilityWidget(),
              //NoDataScreen(title: "hola", subTitle: "este es un error"),
              BoatsMasterWidget(),
              ContactWidget(),
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tips'),
          content: SingleChildScrollView(child: PopupScreen()),
          actions: <Widget>[
            FlatButton(
              child: Text('Start'),
              color: Colors.orange,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
