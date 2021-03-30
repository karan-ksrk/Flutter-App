import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottomNavigation.dart';
import 'topBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_book/components/streams/bestSellerBookStream.dart';
import 'package:e_book/components/streams/featuredBookStream.dart';

FirebaseUser loggedInuser;

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInuser = user;
        print(loggedInuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(controller: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TopBar(),
              Container(
                margin: EdgeInsets.only(left: 36.0, top: 35.53),
                child: Text(
                  'Featured Books',
                  style: TextStyle(fontSize: 19, letterSpacing: 0.6),
                ),
              ),
              Container(
                height: 250.0,
                margin: EdgeInsets.only(top: 23.53),
                child: FeaturedBookStream(),
              ),
              Container(
                margin: EdgeInsets.only(left: 36.0, top: 34.53),
                child: Text(
                  'Best Seller',
                  style: TextStyle(fontSize: 19, letterSpacing: 0.6),
                ),
              ),
              Container(
                height: 239.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 23.53),
                  child: BestSellerBookStream(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
