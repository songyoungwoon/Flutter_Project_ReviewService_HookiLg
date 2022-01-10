import 'package:flutter/material.dart';

import 'writeReview_page.dart';
import '../main.dart';

class reviewList extends StatefulWidget {
  const reviewList({Key? key}) : super(key: key);

  @override
  _reviewListState createState() => _reviewListState();
}

class _reviewListState extends State<reviewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시판'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Center(
            child: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ),
        ],
       //backgroundColor: Colors.grey,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => writeReview()),
          );
        },
        label: const Text('리뷰작성', style: TextStyle(color: Colors.white),),
        icon: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
