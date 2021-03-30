import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 25,
      child: Text(
        'Readify',
        style: TextStyle(
          fontSize: 21,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
