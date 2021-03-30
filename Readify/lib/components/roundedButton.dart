import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.title,
      @required this.color,
      @required this.onPress,
      @required this.textColor});
  final title;
  final Color color;
  final Function onPress;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 302.0,
      height: 49.0,
      child: RaisedButton(
        color: color,
        shape: StadiumBorder(),
        onPressed: () {
          onPress();
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
