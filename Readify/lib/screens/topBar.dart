import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 36.0, right: 38.68),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(Icons.menu, color: Color(0xff707070)),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextField(
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              decoration: InputDecoration.collapsed(hintText: 'Search Here'),
            ),
          ),
          SizedBox(width: 10.0),
          Image.asset('images/search.png', width: 22.35, height: 22.35)
        ],
      ),
    );
  }
}
