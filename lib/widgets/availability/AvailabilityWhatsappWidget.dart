import 'package:flutter/material.dart';
import 'package:oniric/models/Availability.dart';
import '../../constants.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import '../../conf/configuration.dart';

//class AvailabilityWhatsappWidget extends StatelessWidget with Helper {

class AvailabilityWhatsappWidget extends StatelessWidget with Helper {
  final Availability availability;

  AvailabilityWhatsappWidget({
    Key key,
    @required this.availability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: GestureDetector(
      onTap: () {
        openwhatsapp(context);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: const Align(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage(
              'images/whatsapp.png',
            ),
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }

  openwhatsapp(context) async {
    //var whatsapp = "+593999035193";
    var whatsapp = WHATSAPP_CONTACT;
    var departureInfo =
        availability.depStartDate + ' to ' + availability.depEndDate;
    var vessel = availability.cruName;
    print(whatsapp);
    var message =
        "Hi, I like more information about reservations for ${vessel.toUpperCase()} boat from ${departureInfo}";

    // var whatsappURl_android =
    //     "https://api.whatsapp.com/send?phone=$whatsapp='${Uri.parse(message)}'"; // new line

    var whatsappURl_android =
        "https://wa.me/$whatsapp?text='${Uri.parse(message)}'";
    var whatappURL_ios = "https://wa.me/$whatsapp?text='${Uri.parse(message)}'";

    if (Platform.isIOS) {
      // for iOS phone only
      await launch(whatappURL_ios, forceSafariVC: false);
    } else {
      await launch(whatsappURl_android, forceSafariVC: false);
    }
  }
}
