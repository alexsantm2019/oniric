import 'package:flutter/material.dart';
import 'package:oniric/widgets/availability/AvailabilityWidget.dart';
import 'package:oniric/widgets/boats/BoatsMasterWidget.dart';
import 'package:oniric/widgets/contact/ContactWidget.dart';
import 'package:oniric/mixins/Helper.dart';
import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return MaterialApp(
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
                      width: 150, height: 70, fit: BoxFit.fill),
                )
              ],
            ),
            backgroundColor: hexStringToColor(MAIN_COLOR_ORANGE),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
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
              //AvailabilityPickerWidget(),
              BoatsMasterWidget(),
              ContactWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
