import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oniric/mixins/InputValidation.dart';
import 'package:oniric/widgets/contact/CountryListPickWidget.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:intl/intl.dart';

class ContactWidget extends StatelessWidget with InputValidation {
  // final Function onTap;
  // final Function onSwipe;
  // final Function onLongPress;
  final formGlobalKey = GlobalKey<FormState>();

  TextEditingController countryController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController requestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact us'),
      ),
      body: Container(
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            fit: BoxFit.cover,
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
                SizedBox(height: 15),
                CountryListPickWidget(),
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
                  // validator: (email) {
                  //   if (isEmailValid(email))
                  //     return null;
                  //   else
                  //     return 'Enter a valid email address';
                  // },
                ),
                SizedBox(
                  width: double.infinity,
                  child: new ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState.validate()) {
                          formGlobalKey.currentState.save();
                          sendMail();
                          final snackBar =
                              SnackBar(content: Text("Email sended"));
                          Scaffold.of(context).showSnackBar(snackBar);

                          // use the email provided here
                        }
                      },
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

  void sendMail() async {
    String username = 'programming1@andeantc.com';
    String password = 'michwgwqtzxjfhll';

    //String nowDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    String nowDate = DateFormat.yMMMMd('en_US').format(DateTime.now());
    String nowTime = DateFormat.jm().format(DateTime.now());
    String fullDate = nowDate + '(' + nowTime + ')';

    final smtpServer = gmail(username, password);
    final equivalentMessage = Message()
      ..from = Address(username, 'Contact from app')
      ..recipients.add(Address('programming1@andeantc.com'))
      // ..ccRecipients
      //     .addAll([Address('asm_ec@hotmail.com'), 'asm_ec@hotmail.com'])
      // ..bccRecipients.add('asm_ec@hotmail.com')
      //..subject = 'New request from app - ${DateTime.now()}'
      ..subject = 'New request from app - ${fullDate}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Request</h1>\n<p>Hey! ${requestController}</p>";

    await send(equivalentMessage, smtpServer);
  }
}
