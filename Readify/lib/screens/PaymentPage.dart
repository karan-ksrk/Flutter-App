import 'package:e_book/screens/topBar.dart';
import 'package:flutter/material.dart';
import '../components/bottomNavigation.dart';
import '../seventhPage.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({
    @required this.title,
    @required this.author,
    @required this.image,
    @required this.price,
  });
  final String image;
  final String title;
  final String author;
  final String price;

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        controller: 1,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Container(
              margin: EdgeInsets.only(left: 34.0, right: 36.0, top: 32.28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: widget.title,
                    child: Container(
                      height: 200.0,
                      width: 131.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.fill,
                      )),
                    ),
                  ),
                  Container(
                    width: 144.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.author,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(height: 17.0),
                        Text(
                          'Original Ebook',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          '\$ ${widget.price}',
                          style: TextStyle(
                            fontSize: 27.0,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 36.0, top: 63.0),
              child: Text(
                'Select payment Methods',
                style: TextStyle(fontSize: 17.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40.0, top: 43.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.payment),
                  SizedBox(width: 17.5),
                  Text('Amazon Pay'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40.0, top: 43.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.payment),
                  SizedBox(width: 17.5),
                  Text('Amazon Pay'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40.0, top: 43.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.payment),
                  SizedBox(width: 17.5),
                  Text('Amazon Pay'),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 82, left: 37.1, right: 37.1),
                child: ButtonTheme(
                  minWidth: 302.0,
                  height: 38.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowPdf()));
                    },
                    color: Color(0xFF6D93FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Text(
                      'Pay and Processed Ebook',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
