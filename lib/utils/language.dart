import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class Language {
  int id;
  String name;

  Language(this.id, this.name);

  static List<Language> getLanguages() {
    return <Language>[
      Language(1, 'English'),
      Language(2, 'Hindi'),
      Language(3, 'Marathi'),
      Language(4, 'Kannada'),
      Language(5, 'Malayalam'),
    ];
  }
}

class DropDownState extends State<DropDown> {
  //
  List<Language> _languages = Language.getLanguages();
  List<DropdownMenuItem<Language>> _dropdownMenuItems;
  Language _selectedLanguage;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_languages);
    _selectedLanguage = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Language>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Language>> items = List();
    for (Language lang in _languages) {
      items.add(
        DropdownMenuItem(
          value: lang,
          child: Text(lang.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Language selectedLanguage) {
    setState(() {
      _selectedLanguage = selectedLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                  value: _selectedLanguage,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
              ],
            ),
          ),
        );
  }
}