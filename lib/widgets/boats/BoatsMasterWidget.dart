import 'package:flutter/material.dart';
import 'package:oniric/models/Boats.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/boats/BoatCardWidget.dart';
import 'package:oniric/widgets/boats/BoatDetailWidget.dart';

class BoatsMasterWidget extends StatefulWidget {
  @override
  _BoatMasterWidget createState() => _BoatMasterWidget();
}

class _BoatMasterWidget extends State<BoatsMasterWidget> {
  Future<List<Boats>> _boatsList;
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
    _boatsList = _services.getVessels();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Boats>>(
            future: _boatsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Boats> boats = snapshot.data;
                return ListView.builder(
                    itemCount: boats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BoatCardWidget(
                        boat: boats[index],
                        onTap: showDetail,
                      );
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

  void showDetail(Boats boat) async {
    await _services.getBoatInfo(boat.vslId).then((val) {
      // ignore: unrelated_type_equality_checks
      if (val.vslId != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BoatDetailWidget(boatInfo: val, boat: boat);
        }));
      }
    }).catchError((error, stackTrace) {
      final snackBar = SnackBar(
          content: Text(
              "Lo sentimos. No existen datos actualizados para este país actualmente. Inténtelo más tarde"));
      Scaffold.of(context).showSnackBar(snackBar);
      print("Error: $error");
    });
  }
}
