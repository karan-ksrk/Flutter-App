import 'package:flutter/material.dart';
import 'package:e_book/screens/BuyingPage.dart';

class BestSeller extends StatelessWidget {
  BestSeller({
    @required this.image,
    @required this.title,
    @required this.author,
    @required this.price,
  });

  final String image;
  final String title;
  final String author;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      width: 126.33,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BuyingPage(
                    title: title,
                    author: author,
                    image: image,
                    price: price,
                  ),
                ),
              );
            },
            child: Hero(
              tag: title,
              child: Container(
                width: 126.0,
                height: 157.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.0, bottom: 9.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 10),
            ),
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
