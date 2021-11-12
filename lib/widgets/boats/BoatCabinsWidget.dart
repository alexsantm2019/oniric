import 'package:flutter/material.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/models/Cabins.dart';
import 'package:oniric/models/Metadata.dart';
import 'package:oniric/screens/NoDataScreen.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/boats/BoatInfoCabinWidget.dart';
import 'package:grouped_list/grouped_list.dart';
import 'dart:developer';
import '../../constants.dart';

// ignore: must_be_immutable
class BoatCabinsWidget extends StatefulWidget {
  int vslId;
  String boatColor;
  BoatCabinsWidget({Key key, @required this.vslId, this.boatColor})
      : super(key: key);

  @override
  _BoatCabinsWidget createState() => _BoatCabinsWidget();
}

class _BoatCabinsWidget extends State<BoatCabinsWidget> with Helper {
  List<Cabins> _boatCabins;
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
    //_category();
    _readGroup();
  }

  @override
  Widget build(BuildContext context) {
    if (_boatCabins != null) {
      return Container(
        alignment: Alignment.center,
        child: GroupedListView<Cabins, String>(
          elements: _boatCabins,
          groupBy: (element) => element.decName,
          groupSeparatorBuilder: (element) => Container(
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: hexStringToColor(widget.boatColor != null
                      ? widget.boatColor
                      : MAIN_COLOR_ORANGE),
                  border: Border.all(
                    color: hexStringToColor(widget.boatColor != null
                        ? widget.boatColor
                        : MAIN_COLOR_ORANGE),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$element',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          //itemBuilder: (context, dynamic element) => Text(element.cabName),
          itemBuilder: (c, element) {
            return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 35.0, vertical: 5.0),
              child: Container(
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Icon(
                    Icons.event_seat_outlined,
                    color: hexStringToColor(widget.boatColor != null
                        ? widget.boatColor
                        : MAIN_COLOR_ORANGE),
                    size: 38,
                  ),
                  title: Text(
                    element.cabName.toString(),
                    //"hola",
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          element.cabDescription != null
                              ? element.cabDescription.toString()
                              : 'No description',
                          style: TextStyle(fontSize: 12)),
                      Text(
                          element.cabCategoryName != null
                              ? element.cabCategoryName.toString()
                              : 'No category',
                          style: TextStyle(fontSize: 12)),
                      Text(
                          element.cabTypeName != null
                              ? element.cabTypeName.toString()
                              : 'No type',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            );
          },

          // itemComparator: (item1, item2) =>
          //     item1['cabName'].compareTo(item2['cabName']),
          itemComparator: (item1, item2) =>
              item1.cabName.compareTo(item2.cabName),
          useStickyGroupSeparators: true,
          floatingHeader: false,
          order: GroupedListOrder.ASC,
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fitWidth,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstIn),
            image: AssetImage('images/cabin.jpg'),
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  _readGroup() async {
    Future<List<Cabins>> _futureOfList =
        _services.getCabinsByVslId(widget.vslId);
    List<Cabins> list = await _futureOfList;
    if (mounted) {
      if (list != null) {
        setState(() {
          _boatCabins = list;
        });
      }
    }
  }
}
