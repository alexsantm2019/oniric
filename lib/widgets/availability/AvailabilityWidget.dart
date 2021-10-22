import 'package:flutter/material.dart';
import 'package:oniric/models/Availability.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/availability/AvailabilityCardWidget.dart';

class AvailabilityWidget extends StatefulWidget {
  @override
  _AvailabilityWidget createState() => _AvailabilityWidget();
}

class _AvailabilityWidget extends State<AvailabilityWidget> {
  Future<List<Availability>> _availabilityList;
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
    _availabilityList = _services.getAvailability();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Availability>>(
            future: _availabilityList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Availability> availability = snapshot.data;
                return ListView.builder(
                    itemCount: availability.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AvailabilityCardWidget(
                          availability: availability[index]);
                    });
              } else if (snapshot.hasError) {
                return Text("Error Loading Data:  ${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  // void showDetail(Boats boat) async {
  //   await _services.getBoatInfo(boat.vslId).then((val) {
  //     // ignore: unrelated_type_equality_checks
  //     if (val.vslId != null) {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //         return BoatDetailWidget(boatInfo: val, boat: boat);
  //       }));
  //     }
  //   }).catchError((error, stackTrace) {
  //     final snackBar = SnackBar(
  //         content: Text(
  //             "Lo sentimos. No existen datos actualizados para este país actualmente. Inténtelo más tarde"));
  //     Scaffold.of(context).showSnackBar(snackBar);
  //     print("Error: $error");
  //   });
  // }
}
