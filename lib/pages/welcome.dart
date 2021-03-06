
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/pages/login.dart';
import 'package:smart_school/providers/welcome_provider.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var welcomeProvider = Provider.of<WelcomeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(welcomeProvider.bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                welcomeProvider.paperfreeLogo,
                height: 130.0,
                width: 130.0,
              ),
            ),
            Center(child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    )
            ),),
            SizedBox(height: 30.0),
            Center(
              child: Image.asset(
                welcomeProvider.bodyImage,
                height: 350.0,
                width: 340.0,
              ),
            ),
            SizedBox(height: 40.0),
            Center(
              child: ButtonTheme(
                minWidth: 150.0,
                child: RaisedButton(
                  color: Colors.red,
                    child: Text(
                        'Lets Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        )
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    }
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
