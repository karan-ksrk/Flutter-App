import 'package:e_book/screens/homePage.dart';
import 'package:flutter/material.dart';
import '../components/appName.dart';
import '../components/roundedButton.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String email;
  String password;
  bool remind = false;
  bool passObsecure = false;
  Color color = Colors.white;
  IconData icon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff6D93FF),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 36.5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 96.0),
                AppName(),
                SizedBox(height: 93.95),
                Container(
                  child: Image.asset(
                    'images/Girl.png',
                    width: 304.57,
                    height: 219.23,
                  ),
                ),
                SizedBox(height: 55.88),
                Container(
                  width: 302.0,
                  height: 49,
                  padding: EdgeInsets.only(left: 38.75, right: 38.75),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white.withOpacity(0.32),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintStyle: kTextFieldStyle,
                        hintText: 'Email Address'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 302.0,
                  height: 49,
                  padding: EdgeInsets.only(left: 38.75, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white.withOpacity(0.32),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: passObsecure,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              hintStyle: kTextFieldStyle,
                              hintText: 'Password'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            icon = icon == Icons.visibility
                                ? Icons.visibility_off
                                : Icons.visibility;
                            passObsecure =
                                icon == Icons.visibility ? false : true;
                          });
                        },
                        icon: Icon(
                          icon,
                          color: Colors.white.withOpacity(0.32),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 34),
                RoundedButton(
                  title: 'Login',
                  color: Colors.white,
                  textColor: Color(0xff6D93FF),
                  onPress: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ThirdPage();
                            }),
                          );
                        });
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {}
                  },
                ),
                SizedBox(height: 21.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Checkbox(
                        checkColor: Colors.blue,
                        activeColor: Colors.white,
                        focusColor: Colors.white,
                        value: remind,
                        onChanged: (value) {
                          setState(() {
                            remind = value;
                          });
                        },
                      ),
                      Spacer(),
                      Text(
                        'Remember me',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 9.0,
                            color: Colors.white),
                      ),
                      Spacer(
                        flex: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          print('Forgot');
                        },
                        child: Text(
                          'FORGOT PASSWORD?',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 9.0,
                              color: color),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Image.asset(
                            'images/google.png',
                            width: 29.0,
                            height: 29.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 11.0),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Center(
                                child: Image.asset('images/facebook.png',
                                    width: 29.0, height: 29.0),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
