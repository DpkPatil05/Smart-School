import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/providers/home_provider.dart';
import 'package:smart_school/providers/welcome_provider.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var welcomeProvider = Provider.of<WelcomeProvider>(context, listen: true);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'By',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          Container(
            child: Image.network(welcomeProvider.paperfreeLogo),
          ),
          SizedBox(height: 50.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Developed By',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 13.0),
                  ImageIcon(
                      AssetImage(HomeProvider().linkedinlogo)
                  ),
                  FlatButton(
                    onPressed: (){},
                    child: Text('Deepak Patil'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 13.0),
                  ImageIcon(
                      AssetImage(HomeProvider().linkedinlogo)
                  ),
                  FlatButton(
                    onPressed: (){},
                    child: Text('Pragati Naik'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 13.0),
                  ImageIcon(
                      AssetImage(HomeProvider().linkedinlogo)
                  ),
                  FlatButton(
                    onPressed: (){},
                    child: Text('Vishaal Nair'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}