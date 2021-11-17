import 'package:flutter/material.dart';
import 'package:oniric/models/Boats.dart';
import 'package:oniric/screens/NoDataScreen.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/boats/BoatCardWidget.dart';
import 'package:oniric/widgets/boats/BoatDetailBoatWidget.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Boats>>(
            future: _boatsList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR: ${snapshot.error}"),
                );
              } else {
                if (snapshot.hasData && snapshot.data.isNotEmpty) {
                  List<Boats> boats = snapshot.data;
                  return ListView.builder(
                      padding: EdgeInsets.all(0.0),
                      itemCount: boats.length,
                      itemBuilder: (BuildContext context, int index) {
                        //return
                        // Hero(
                        //     //tag: "some_name"+index.toString(),
                        //     //tag: boats[index],
                        //     tag: index,
                        //     child: BoatCardWidget(
                        //       boat: boats[index],
                        //       tag: index,
                        //       onTap: showDetail,
                        //     ));

                        return BoatCardWidget(
                          boat: boats[index],
                          onTap: showDetail,
                        );
                      });
                } else
                  return Center(
                    child: NoDataScreen(
                      title: "No boats",
                      subTitle: "There is no boats info",
                    ),
                  );
              }
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
          return BoatDetailBoatWidget(boatInfo: val, boat: boat);
        }));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) =>
        //             BoatDetailBoatWidget(boatInfo: val, boat: boat)));
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
