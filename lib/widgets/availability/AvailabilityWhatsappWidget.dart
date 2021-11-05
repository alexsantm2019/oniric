import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class AvailabilityWhatsappWidget extends StatelessWidget with Helper {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: GestureDetector(
      onTap: () {
        print("Haciendo tap");
        openwhatsapp(context);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Image(
          image: AssetImage(
            'images/whatsapp.png',
          ),
          width: 25,
          height: 25,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }

  openwhatsapp(context) async {
    var whatsapp = "+593999035193";
    var message = "Hola";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";

    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed for IOs")));
      }
    } else {
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed for Android")));
      }
    }
  }
}
