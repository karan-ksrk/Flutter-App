import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottomNavigation.dart';
import 'topBar.dart';
import 'package:e_book/screens/PaymentPage.dart';

class BuyingPage extends StatefulWidget {
  BuyingPage({
    @required this.title,
    @required this.author,
    @required this.image,
    @required this.price,
  });
  final String title;
  final String author;
  final String image;
  final String price;

  @override
  _BuyingPageState createState() => _BuyingPageState();
}

class _BuyingPageState extends State<BuyingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(controller: 1),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TopBar(),
            SizedBox(height: 36.0),
            Hero(
              tag: widget.title,
              child: Container(
                  width: 100.0,
                  height: 292.0,
                  margin: EdgeInsets.symmetric(horizontal: 91.5),
                  child: Image(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.fitHeight,
                  )),
            ),
            SizedBox(height: 24.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 84.5),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 144.5),
              child: Text(
                widget.author,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 48.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ButtonTheme(
                    height: 40.0,
                    minWidth: 125.1,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              title: widget.title,
                              author: widget.author,
                              image: widget.image,
                              price: widget.price,
                            ),
                          ),
                        );
                      },
                      color: Color(0xFF6D93FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Text(
                        'Buy Ebook',
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    height: 40.0,
                    minWidth: 125.1,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      splashColor: Colors.red,
//                      disabledColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFFFFA5D2)),
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Text(
                        'Buy Audio',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 42.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 36.0),
              child: Container(
                child: Text(
                  'More Like This',
                  style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 132.7,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: double.infinity, height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: double.infinity, height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: double.infinity, height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 71.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.5),
                            child: Image.asset(
                              'images/books/book2.png',
                              fit: BoxFit.fitHeight,
//                fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            width: 71.0,
                            child: Text(
                              'Norse Mythology',
                              style: TextStyle(fontSize: 9.0),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
