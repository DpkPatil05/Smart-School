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
              Row(
                children: [
                  SizedBox(width: 20.0),
                  Text(
                      "Language",
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                ],
              ),
              LanguageDropDown()
            ],
          )
          ),
        Card(
            child: InkWell(
              onTap: (){},
              child: Container(
                height: 50.0,
                child: Row(
                  children: [
                    SizedBox(width: 20.0),
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                  ]
                ),
              ),
            )
        ),
        Card(
            child: InkWell(
              onTap: (){},
              child: Container(
                height: 50.0,
                child: Row(
                  children: [
                    SizedBox(width: 20.0),
                    Text(
                      "Track Driver",
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
      ],
    );
  }
}
