import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'screens/loginPage.dart';
import 'screens/homePage.dart';
import 'screens/BuyingPage.dart';
import 'components/appName.dart';
import 'screens/loginRegisterPage.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Page1(),
      routes: <String, WidgetBuilder>{
        "/SecondPage": (BuildContext context) => new LoginPage(),
        "/ThirdPage": (BuildContext context) => new ThirdPage(),
        "/ForthPage": (BuildContext context) => new BuyingPage()
      },
    ));

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6D93FF),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 96),
                AppName(),
                SizedBox(height: 93.95),
                Container(
                  width: 302.94,
                  height: 280.05,
                  child: ListView(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/mobile_png3.png',
                              width: 250.94,
                              height: 168.3,
                            ),
                          ),
                          SizedBox(
                            height: 22.75,
                          ),
                          Container(
                            width: 302,
                            height: 76,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipis- cing elit. Morbi ac suscipit nibh, vel dignissim dui. Cras pulvinar velit ut rutrum vulputate. Cras posuere vitae purus sit amet feugiat.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/mobile_png3.png',
                              width: 250.94,
                              height: 168.3,
                            ),
                          ),
                          SizedBox(
                            height: 22.75,
                          ),
                          Container(
                            width: 302,
                            height: 76,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipis- cing elit. Morbi ac suscipit nibh, vel dignissim dui. Cras pulvinar velit ut rutrum vulputate. Cras posuere vitae purus sit amet feugiat.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/mobile_png3.png',
                              width: 250.94,
                              height: 168.3,
                            ),
                          ),
                          SizedBox(
                            height: 22.75,
                          ),
                          Container(
                            width: 302,
                            height: 76,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipis- cing elit. Morbi ac suscipit nibh, vel dignissim dui. Cras pulvinar velit ut rutrum vulputate. Cras posuere vitae purus sit amet feugiat.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19),
                Container(
                  height: 20,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: 0,
                    decorator: DotsDecorator(
                      color: Colors.white,
                      activeColor: Colors.white,
                      size: Size.square(4.0),
                      activeSize: Size(6.0, 6.0),
                      spacing: EdgeInsets.all(2.0),
                    ),
                  ),
                ),
                SizedBox(height: 23),
                ButtonTheme(
                  minWidth: 302.0,
                  height: 49.0,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new LoginRegisterPage()),
                      );
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff6D93FF),
                        fontFamily: 'Roboto',
                      ),
                    ),
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
