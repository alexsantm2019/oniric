import 'package:flutter/material.dart';
import 'package:oniric/models/Cabins.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/boats/BoatInfoCabinWidget.dart';

// ignore: must_be_immutable
class BoatCabinsWidget extends StatefulWidget {
  int vslId;
  BoatCabinsWidget({Key key, @required this.vslId}) : super(key: key);

  @override
  _BoatCabinsWidget createState() => _BoatCabinsWidget();
}

class _BoatCabinsWidget extends State<BoatCabinsWidget> {
  Future<List<Cabins>> _boatCabins;
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
    _boatCabins = _services.getCabinsByVslId(widget.vslId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cabins>>(
      future: _boatCabins,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Cabins> cabin = snapshot.data;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: cabin.length,
              itemBuilder: (BuildContext context, int index) {
                return BoatInfoCabinWidget(cabin: cabin[index]);
              });
        } else if (snapshot.hasError) {
          return Text("Error Loading Data:  ${snapshot.error}");
        }
        // By default show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
