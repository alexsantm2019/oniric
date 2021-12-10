import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import 'package:oniric/models/Boats.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/widgets/boats/BoatTableWidget.dart';
import 'package:oniric/widgets/boats/BoatServicesWidget.dart';
import 'package:oniric/widgets/boats/BoatCabinsWidget.dart';

class BoatDetailBoatWidget extends StatelessWidget with Helper {
  final Boats boatInfo;
  final Boats boat;

  BoatDetailBoatWidget({@required this.boatInfo, this.boat});

  @override
  Widget build(BuildContext context) {
    int vslId = boatInfo.vslId;
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true, // hides default back button
            // (*) Degradado:
            flexibleSpace: Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    hexStringToColor(boatInfo.vslColor != null
                        ? boatInfo.vslColor
                        : MAIN_COLOR_ORANGE),
                    Color(0xFFFF),
                  ]),
            )),
            // (*) Color standar en appBar
            //backgroundColor: hexStringToColor(MAIN_COLOR_ORANGE),
            // backgroundColor: hexStringToColor(boatInfo.vslColor != null
            //     ? boatInfo.vslColor
            //     : MAIN_COLOR_ORANGE),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Icon(
                  FontAwesomeIcons.ship,
                  size: 20,
                ),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(boatInfo.vslName, style: titleDetailBoatStyle))
              ],
            ),

            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(text: "Information"),
                Tab(text: 'Services'),
                Tab(text: 'Cabins'),
                //Tab(text: 'Decks'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BoatTableWidget(
                boatInfo: boatInfo,
              ),
              BoatServicesWidget(vslId: vslId, boatColor: boatInfo.vslColor),
              BoatCabinsWidget(vslId: vslId, boatColor: boatInfo.vslColor),
            ],
          ),
        ),
      ),
    );
  }
}
