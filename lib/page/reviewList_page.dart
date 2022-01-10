import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'writeReview_page.dart';
import 'writeReview_page_test.dart';
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('review').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("firebase load fail"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("loading"));
          }
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(snapshot.data.docs[index]['title']),
                  subtitle: Text(snapshot.data.docs[index]['content']),
                );
              },
            );

        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => writeReviewTest()),
          );
        },
        label: const Text(
          '리뷰작성',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void createdata(String code, String name, String status) {
  final usercol = FirebaseFirestore.instance.collection("players").doc("$code");
  usercol.set({
    "name": "$name",
    "status": "$status",
  });
}

void readdata(String code) {
  final usercol = FirebaseFirestore.instance.collection("players").doc("$code");
  usercol.get().then((value) => {print(value.data())});
}

void updatedata(String code, String status) {
  final usercol = FirebaseFirestore.instance.collection("players").doc("$code");
  usercol.update({
    "status": "$status",
  });
}

void deleteData() {
  final usercol = FirebaseFirestore.instance.collection("review").doc();
  usercol.delete();
}
