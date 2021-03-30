import 'package:e_book/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:e_book/screens/registerPage.dart';
import '../components/roundedButton.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6D93FF),
      body: Center(
        child: Container(
          width: 302.0,
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RoundedButton(
                title: 'Login',
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ));
                },
              ),
              RoundedButton(
                title: 'Register',
                color: Colors.deepPurpleAccent,
                textColor: Colors.white,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
