import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book/components/bestSeller.dart';

final _firestore = Firestore.instance;

class BestSellerBookStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('best seller books').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final books = snapshot.data.documents;
          List<BestSeller> bestSellerbooks = [];
          for (var book in books) {
            final title = book.data['Title'];
            final author = book.data['Author'];
            final image = book.data['image'];
            final price = book.data['Price'].toString();
            print(price);
            final bookBubble = BestSeller(
              image: image,
              title: title,
              author: author,
              price: price,
            );
            bestSellerbooks.add(bookBubble);
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: bestSellerbooks,
          );
        });
  }
}
