import 'package:flutter/material.dart';
import 'package:oniric/models/Service.dart';
import 'package:oniric/screens/NoDataScreen.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/boats/BoatInfoServices.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class BoatServicesWidget extends StatefulWidget {
  int vslId;
  String boatColor;
  BoatServicesWidget({Key key, @required this.vslId, this.boatColor})
      : super(key: key);

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
    return AnimatedContainer(
      duration: const Duration(seconds: 10),
      curve: Curves.fastOutSlowIn,
      child: FutureBuilder<List<Service>>(
        future: _boatServices,
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
              List<Service> service = snapshot.data;

              return AnimationLimiter(
                child: GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 400),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: BoatInfoServicesWidget(
                                service: service[index],
                                boatColor: widget.boatColor),
                          ),
                        ),
                      );
                    }),
              );
            } else
              return Center(
                child: NoDataScreen(
                  title: "No Services",
                  subTitle: "There are no services available",
                ),
              );
          }
        },
      ),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          fit: BoxFit.fitWidth,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstIn),
          image: AssetImage('images/services.jpg'),
        ),
      ),
    );
  }
}
