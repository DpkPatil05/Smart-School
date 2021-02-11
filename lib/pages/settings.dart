import 'package:flutter/material.dart';
import 'package:smart_school/utils/language.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Language",
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
              LanguageDropDown()
            ],
          )
          )
      ],
    );
  }
}
