import 'package:flutter/material.dart';
import '../screens/BuyingPage.dart';

class FeaturedBooks extends StatelessWidget {
  FeaturedBooks({
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
  Widget build(BuildContext context) {
    return GestureDetector(
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
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          width: 188.0,
          height: 230.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
