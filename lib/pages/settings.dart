import 'package:flutter/material.dart';
import 'file:///C:/Users/ashup/AndroidStudioProjects/Smart-School/lib/utils/language.dart';

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
              Text("Languages"),
              DropDown()
            ],
          )
          )
      ],
    );
  }
}
