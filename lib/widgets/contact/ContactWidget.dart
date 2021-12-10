import 'package:flutter/material.dart';
import 'package:oniric/mixins/Helper.dart';
import 'package:oniric/mixins/InputValidation.dart';
import 'package:oniric/services/services.dart';
import 'package:oniric/widgets/contact/CountryListPickWidget.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';

class ContactWidget extends StatelessWidget with InputValidation, Helper {
  final formGlobalKey = GlobalKey<FormState>();
  String countryCode = "";
  TextEditingController countryController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController mobileController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController requestController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          //color: const Color(0xff7c94b6),
          image: new DecorationImage(
            fit: BoxFit.fitHeight,
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("images/contact.jpeg"),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          //padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                //SizedBox(height: 15),
                CountryListPickWidget(
                    onSelectCountry: (String country, String code) {
                  countryController.text = country;
                  countryCode = code;
                }),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (name) {
                    if (isNameValid(name))
                      return null;
                    else
                      return 'Name must have at least 5 characters';
                  },
                ),
                TextFormField(
                  controller: mobileController,
                  decoration: InputDecoration(labelText: "Mobile number"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (mobile) {
                    if (isMobileValid(mobile))
                      return null;
                    else
                      return 'Invalid mobile number';
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))
                  ],
                  validator: (email) {
                    if (isEmailValid(email))
                      return null;
                    else
                      return 'Enter a valid email address';
                  },
                ),
                TextFormField(
                  controller: requestController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(labelText: "Request"),
                  maxLines: 4,
                  maxLength: 300,
                ),
                SizedBox(
                  width: double.infinity,
                  child: new ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState.validate()) {
                          formGlobalKey.currentState.save();
                          sendMailApp(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: hexStringToColor(MAIN_COLOR_ORANGE != null
                              ? MAIN_COLOR_ORANGE
                              : Colors.orange.shade600),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      child: Text("Submit")),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ) /* add child content here */,
      ),
    );
  }

  void sendMailApp(context) async {
    final Services _services = new Services();
    final data = {
      'pais': countryController.text,
      'nombre': nameController.text,
      'celular': countryCode + mobileController.text,
      'email': emailController.text,
      'solicitud': requestController.text,
    };
    await _services.sendMailApp(data).then((val) {
      // ignore: unrelated_type_equality_checks
      if (val != null) {
        final snackBar = SnackBar(content: Text("Email sended successfully"));
        Scaffold.of(context).showSnackBar(snackBar);
        cleanFields();
      }
    }).catchError((error, stackTrace) {
      final snackBar = SnackBar(content: Text("Sorry, email was not sended"));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void cleanFields() {
    countryController.clear();
    nameController.clear();
    mobileController.clear();
    emailController.clear();
    requestController.clear();
  }
}
