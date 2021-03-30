import 'package:flutter/material.dart';
import 'package:rapidhealthinfo/screens/showInfo.dart';
import 'dart:math';
import 'package:rapidhealthinfo/components/roundButtonGradient.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rapidhealthinfo/components/worldData.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  AnimationController colorController;
  Animation colorAnimation;

  @override
  void initState() {
    WorldData().updateData();
    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
      upperBound: pi * 0.3,
    );
    colorController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.orange)
        .animate(colorController);
    super.initState();
    colorController.forward(from: 0.0);
    rotationController.forward(from: 0.0);
    colorController.addListener(() {
      setState(() {});
    });
//    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    rotationController.dispose();
    colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 1.0).animate(rotationController),
                  child: Hero(
                    tag: 'virus',
                    child: Image.asset(
                      "images/coronavirus.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  "BE",
                  style: TextStyle(fontSize: 43.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20.0),
                Container(
                  width: 160.0,
                  child: RotateAnimatedTextKit(
                    text: ["Safe   ", "Clean  ", "Curious"],
                    textStyle: TextStyle(
                      fontSize: 41.0,
                      color: Colors.white,
                      fontFamily: 'Horizon',
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart,
                    transitionHeight: 100.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 50.0,
              width: 300.0,
              child: RoundButtonGradient(
                text: "Get Started",
                onPress: () {
                  Navigator.pushNamed(context, ShowInfo.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
