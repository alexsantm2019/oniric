import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';

class CountryListPickWidget extends StatelessWidget {
  Function(String, String) onSelectCountry;
  CountryListPickWidget({Key key, this.onSelectCountry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        alignment: Alignment.center,
        color: Colors.transparent,
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
              initialSelection: '+672', //inital selection, +672 for Antarctica
              onChanged: (CountryCode code) {
                onSelectCountry(code.name, code.dialCode);
                // print(code.name); //get the country name eg: Antarctica
                // print(code.code); //get the country code like AQ for Antarctica
                // print(code
                //     .dialCode); //get the country dial code +672 for Antarctica
                // print(code
                //     .flagUri); //get the URL of flag. flags/aq.png for Antarctica
              },
            ),
          ),
        ));
  }
}
