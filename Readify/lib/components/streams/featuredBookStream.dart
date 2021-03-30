import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:e_book/components/featuredBook.dart';

final _firestore = Firestore.instance;

class FeaturedBookStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('featured books').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final books = snapshot.data.documents;
        List<FeaturedBooks> featuredBooks = [];
        for (var book in books) {
          final title = book.data['Title'];
          final author = book.data['Author'];
          final image = book.data['image'];
          final price = book.data['Price'].toString();
          final bookBubble = FeaturedBooks(
              title: title, author: author, image: image, price: price);
          featuredBooks.add(bookBubble);
        }
        return ListView(
          scrollDirection: Axis.horizontal,
          children: featuredBooks,
        );
      },
    );
  }
}
