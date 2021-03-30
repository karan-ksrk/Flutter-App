import 'package:flutter/material.dart';

class RoundButtonGradient extends StatelessWidget {
  RoundButtonGradient({@required this.text, @required this.onPress});

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        onPress();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff374ABE),
              Color(0xff64B6FF),
            ]),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxHeight: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
