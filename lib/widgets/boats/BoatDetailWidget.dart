import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:oniric/models/Boats.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/widgets/boats/BoatTableWidget.dart';
import 'package:oniric/widgets/boats/BoatServicesWidget.dart';
import 'package:oniric/widgets/boats/BoatDecksWidget.dart';
import 'package:oniric/widgets/boats/BoatCabinsWidget.dart';

class BoatDetailWidget extends StatelessWidget with Helper {
  final Boats boatInfo;
  final Boats boat;

  BoatDetailWidget({@required this.boatInfo, this.boat});

  @override
  Widget build(BuildContext context) {
    int vslId = boatInfo.vslId;
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(boatInfo.vslAlias, style: titleDetailBoatStyle))
              ],
            ),
            //backgroundColor: hexStringToColor(MAIN_COLOR_ORANGE),
            backgroundColor: hexStringToColor(boatInfo.vslColor != null
                ? boatInfo.vslColor
                : MAIN_COLOR_ORANGE),
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
              //Text("Servicios"),
              BoatTableWidget(
                boatInfo: boatInfo,
              ),
              BoatServicesWidget(vslId: vslId),
              BoatCabinsWidget(vslId: vslId),
              // BoatDecksWidget(
              //   boatInfo: boatInfo,
              // ),
              // BoatCabinsWidget(
              //   boatInfo: boatInfo,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
