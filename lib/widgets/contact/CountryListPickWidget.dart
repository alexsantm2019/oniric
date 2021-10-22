import 'package:flutter/material.dart';
import 'package:oniric/models/Cabins.dart';
import '../../constants.dart';
import 'package:country_list_pick/country_list_pick.dart';

class CountryListPickWidget extends StatelessWidget {
  CountryListPickWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        alignment: Alignment.center,
        child: Card(
          child: SizedBox(
            width: double.infinity,
            child: CountryListPick(
              theme: CountryTheme(
                isShowFlag: true,
                isShowTitle: true,
                isShowCode: true,
                isDownIcon: true,
                showEnglishName: true,
              ),
              initialSelection: '+593', //inital selection, +672 for Antarctica
              onChanged: (CountryCode code) {
                print(code.name); //get the country name eg: Antarctica
                print(code.code); //get the country code like AQ for Antarctica
                print(code
                    .dialCode); //get the country dial code +672 for Antarctica
                print(code
                    .flagUri); //get the URL of flag. flags/aq.png for Antarctica
              },
            ),
          ),
        ));
  }
}
