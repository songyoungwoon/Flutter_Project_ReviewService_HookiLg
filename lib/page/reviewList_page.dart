import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/page/showReview_page.dart';

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
          return Container(
              width: 400,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Center(
                    child: ListView.builder(
                     itemCount: snapshot.data.docs.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => showReview(
                                      snapshot.data.docs[index]['title'],
                                      snapshot.data.docs[index]['content'])),
                            );
                          },
                          title: Container(
                              // width: 400,
                              height: 60,
                              padding:
                                  EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                             decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pinkAccent)),
                              alignment: Alignment.center,
                              child: Row(children: [
                                Column(
                                  
                                  children: [
                                    Text(snapshot.data.docs[index]['title'],
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                                    Text(
                                      snapshot.data.docs[index]['content'],
                                      
                                    )
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.pink[200],
                                )
                              ])),
                     
                        );
                      },
                   )),
                  ));
           },
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => writeReview()),
          );
        },
        label: const Text(
          '리뷰작성',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        icon: const Icon(
          Icons.create,
          color: Colors.white,
        ),
        backgroundColor: Colors.pink[200],
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
