import 'package:flutter/material.dart';
import 'package:oniric/models/Availability.dart';
import 'package:oniric/models/Itinerary.dart';
import 'package:oniric/widgets/availability/AvailabilityBoxesWidget.dart';
import 'package:oniric/widgets/availability/AvailabilityWhatsappWidget.dart';
import 'package:oniric/widgets/boats/BoatDetailBoatWidget.dart';
import '../../constants.dart';
import 'package:intl/intl.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/services/services.dart';
import 'AvailabilityItineraryWidget.dart';

class AvailabilityCardWidget extends StatelessWidget with Helper {
  final Availability availability;
  final Services _services = new Services();

  AvailabilityCardWidget({
    Key key,
    @required this.availability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding:
          EdgeInsets.only(top: 1.00, bottom: 1.00, left: 11.00, right: 11.00),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(0.0),
                    width: 10.0,
                    height: 50.0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 6.0,
                        backgroundColor: availability.depStatus == "1"
                            ? Colors.green
                            : Colors.red,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.only(left: 9.00, right: 9.00),
                  //width: 115.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 87.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.directions_boat_filled_outlined,
                                color: hexStringToColor(availability.vslColor),
                                size: 19,
                              ),
                              // Text(capitalize(availability.cruName),
                              //     textAlign: TextAlign.center,
                              //     //style: cruNameStyles,
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontStyle: FontStyle.normal,
                              //         fontWeight: FontWeight.bold,
                              //         color: hexStringToColor(
                              //             availability.vslColor))),
                              new GestureDetector(
                                onTap: () {
                                  showDetailBoat(availability.vslId, context);
                                },
                                child: Text(capitalize(availability.cruName),
                                    textAlign: TextAlign.center,
                                    //style: cruNameStyles,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        color: hexStringToColor(
                                            availability.vslColor))),
                              )
                            ]),
                      ),
                      Text(
                          availability.depStartDate != ''
                              ? DateFormat.yMMMMd('en_US').format(
                                  DateTime.parse(availability.depStartDate))
                              : "No description",
                          textAlign: TextAlign.left,
                          style: departuresDatesStyles),
                      Text(
                          availability.depEndDate != ''
                              ? DateFormat.yMMMMd('en_US').format(
                                  DateTime.parse(availability.depEndDate))
                              : "No description",
                          textAlign: TextAlign.left,
                          style: departuresDatesStyles),
                    ],
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        //padding: EdgeInsets.only(: 5.00),
                        width: 75.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: Colors.indigo.shade100,
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              int itiId = availability.itiId;
                              print("tapped on container $itiId");
                              showDetailItinerary(context, itiId);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      availability.itiCode != null
                                          ? 'Itin: ' + availability.itiCode
                                          : '-',
                                      textAlign: TextAlign.center,
                                      style: itineraryStyles),
                                  Text(
                                      availability.itiNights.toString() +
                                          ' night(s)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.normal)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                AvailabilityBoxesWidget(
                    num: numAvailables(availability.cabins).toString(),
                    color: Colors.green,
                    description: "Disponibiles"),
                AvailabilityBoxesWidget(
                    num: numBlocked(availability.cabins).toString(),
                    color: Colors.yellow.shade700,
                    description: "Bloqueados"),
                AvailabilityBoxesWidget(
                    num: numConfirmed(availability.cabins).toString(),
                    color: Colors.pink.shade400,
                    description: "Confirmados"),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 80.0,
                        padding: EdgeInsets.all(1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            availability.prices['rate'] != null
                                ? Text(
                                    ' \$ ' +
                                        availability.prices['rate'].toString(),
                                    textAlign: TextAlign.right,
                                    style: priceStyles,
                                  )
                                : Text("\$ 0",
                                    textAlign: TextAlign.right,
                                    style: priceStyles),
                            AvailabilityWhatsappWidget(
                              availability: availability,
                            ),
                          ],
                        ),
                      ),
                    ])
              ],
            ),
            new Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }

  void showDetailItinerary(context, itiId) async {
    await _services.getItinerariesByItiId(itiId).then((val) {
      // ignore: unrelated_type_equality_checks
      if (val != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AvailabilityItineraryWidget(itineraryInfo: val);
        }));
      }
    }).catchError((error, stackTrace) {
      final snackBar = SnackBar(
          content: Text("Sorry, we do not have itinerary information"));
      Scaffold.of(context).showSnackBar(snackBar);
      print("Error: $error");
    });
  }

  void showDetailBoat(vslId, context) async {
    await _services.getBoatInfo(vslId).then((val) {
      // ignore: unrelated_type_equality_checks
      var boat = val;
      if (val.vslId != null) {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => BoatDetailBoatWidget(boatInfo: val, boat: boat),
        ));
      }
    }).catchError((error, stackTrace) {
      final snackBar = SnackBar(
          content: Text("We're sorry. There is no data for the selected boat"));
      Scaffold.of(context).showSnackBar(snackBar);
      print("Error: $error");
    });
  }
}
