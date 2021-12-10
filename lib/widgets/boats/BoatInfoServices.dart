import 'package:flutter/material.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/models/Service.dart';
import '../../constants.dart';

class BoatInfoServicesWidget extends StatelessWidget with Helper {
  final Service service;
  final String boatColor;

  BoatInfoServicesWidget({Key key, @required this.service, this.boatColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: new Card(
        //color: Colors.transparent,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // Con esta propiedad modificamos la forma de nuestro card
        // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: hexStringToColor(
                  boatColor != null ? boatColor : MAIN_COLOR_ORANGE),
              width: 1),
        ),

        // Con esta propiedad agregamos margen a nuestro Card
        // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
        margin: EdgeInsets.all(18),

        // Con esta propiedad agregamos elevación a nuestro card
        // La sombra que tiene el Card aumentará
        elevation: 10,

        // La propiedad child anida un widget en su interior
        // Usamos columna para ordenar un ListTile y una fila con botones
        child: Column(
          children: <Widget>[
            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              title: Text(service.serName),
              subtitle: Text(service.serDescription != ''
                  ? service.serDescription
                  : "No description"),
              //leading: Icon(Icons.brunch_dining, size: 38),
              leading: Icon(_getIcon(service.serName),
                  color: hexStringToColor(
                      boatColor != null ? boatColor : MAIN_COLOR_ORANGE),
                  size: 38),
            ),
          ],
        ),
      ),
    );
  }

  _getIcon(name) {
    if (name.contains('Air')) return Icons.air_sharp;
    if (name.contains('Electricity')) return Icons.electrical_services;
    if (name.contains('Hair')) return Icons.brunch_dining; //revisar
    if (name.contains('Internet')) return Icons.signal_wifi_4_bar;
    if (name.contains('Jacuzzi')) return Icons.pool;
    if (name.contains('Kayak')) return Icons.kayaking;
    if (name.contains('Balcony')) return Icons.balcony;
    if (name.contains('facilities')) return Icons.add_shopping_cart;
    if (name.contains('snorkel')) return Icons.pool_sharp;
    if (name.contains('suits'))
      return Icons.pool_sharp;
    else
      return Icons.brunch_dining;
  }
}
