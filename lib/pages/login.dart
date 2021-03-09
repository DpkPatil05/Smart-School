import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:smart_school/modal/login.dart';
import 'package:smart_school/providers/login_provider.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormFieldState<String>>
    _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  bool _obscureText = true;
  final RoundedLoadingButtonController _btnController =
  new RoundedLoadingButtonController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    toast(String msg) {
      Fluttertoast.showToast(
          msg: msg, //get msg
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    _loginUser(LoginData loginData) {
      _btnController.success();
      Timer(Duration(seconds: 1), () {
        _btnController.reset();
      });
      toast('Login success');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home(
          site: loginData.sitename,
          school: loginData.schoolname,
          userrole : loginData.userrole,
          studentid: loginData.studentid,
          firstlast: loginData.firstlast,
          imgurl: loginData.imgurl?.replaceAll('\\', '')??'',
          classsection: loginData.classsection,
          standard: loginData.loginDataClass
        )),
      );
    }

    _loginError(String msg) {
      _btnController.error();
      Timer(Duration(seconds: 1), () {
        _btnController.reset();
      });
      toast(msg);
    }

    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (BuildContext context, loginProvider, _) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(loginProvider.background),
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
                      loginProvider.bodyImg1,
                      height: 150.0,
                      width: 380.0,
                    ),
                  ),
                  Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 20.0),
                          Container(
                            width: 330.0,
                            child: TextFormField(
                              controller: userController,
                              textCapitalization: TextCapitalization.words,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(
                                  Icons.person,
                                  size: 40.0,
                                  color: Colors.black,
                                ),
                                labelText: 'Enter your username',
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 20.0),
                          Container(
                            width: 330.0,
                            child: TextFormField(
                              key: _passwordFieldKey,
                              obscureText: _obscureText,
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Enter your password',
                                labelStyle: TextStyle(color: Colors.white,),
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(
                                  Icons.security,
                                  size: 40.0,
                                  color: Colors.black,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText ? Icons.visibility :
                                    Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 60.0),
                  RoundedLoadingButton(
                      width: 150.0,
                      color: Colors.red,
                      controller: _btnController,
                      child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white
                          )
                      ),
                      onPressed: () {
                        loginProvider.login(userController.text, passwordController.text) == 'process'?
                        loginProvider.fetchUser().then((loginData) =>
                          loginData.success.toString() == '1' ?
                            _loginUser(loginData) : _loginError('Incorrect details'))
                        : _loginError(loginProvider.login(userController.text, passwordController.text).toString());
                      }
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}
