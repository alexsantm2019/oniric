import 'package:flutter/material.dart';

class Helper {
  hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

// Funciones para retornar número de espacios disponibles / bloqueados / confirmados (AVAILABILITY)
  numAvailables(List<dynamic> array) {
    int slotsWithBooking = 0;
    array.map((cabin) {
      cabin['slots'].map((booking) {
        if (booking['booking'] == null) slotsWithBooking += 1;
      }).toList();
    }).toList();
    return slotsWithBooking;
  }

  numBlocked(List<dynamic> array) {
    int slotsWithBooking = 0;
    array.map((cabin) {
      cabin['slots'].map((booking) {
        if (booking['booking'] != null) {
          if (booking['booking']['bosStatus'] == 1) slotsWithBooking += 1;
          if (booking['booking']['bosStatus'] == 0 &&
              booking['booking']['bosCondition'] == 1) slotsWithBooking += 1;
        }
      }).toList();
    }).toList();
    return slotsWithBooking;
  }

  numConfirmed(List<dynamic> array) {
    int slotsWithBooking = 0;
    array.map((cabin) {
      cabin['slots'].map((booking) {
        if (booking['booking'] != null) {
          if (booking['booking']['bosStatus'] == 2) slotsWithBooking += 1;
        }
      }).toList();
    }).toList();
    return slotsWithBooking;
  }

  //String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  String capitalize(String s) {
    var string = s.toLowerCase();
    return string[0].toUpperCase() + string.substring(1);
  }
}
