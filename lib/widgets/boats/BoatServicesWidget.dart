import 'package:flutter/material.dart';
import 'package:oniric/models/Service.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/boats/BoatInfoServices.dart';

// ignore: must_be_immutable
class BoatServicesWidget extends StatefulWidget {
  int vslId;
  BoatServicesWidget({Key key, @required this.vslId}) : super(key: key);

  @override
  _BoatServicesWidget createState() => _BoatServicesWidget();
}

class _BoatServicesWidget extends State<BoatServicesWidget> {
  Future<List<Service>> _boatServices;
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
    _boatServices = _services.getServicesByVslId(widget.vslId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Service>>(
      future: _boatServices,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Service> service = snapshot.data;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: service.length,
              itemBuilder: (BuildContext context, int index) {
                return BoatInfoServicesWidget(service: service[index]);
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
