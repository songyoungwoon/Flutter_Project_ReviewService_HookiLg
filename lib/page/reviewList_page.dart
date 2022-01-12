import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'writeReview_page.dart';
import 'writeReviewTest_page.dart';
import 'showReview_page.dart';
import 'showReviewTest_page.dart';

class reviewList extends StatefulWidget {
  String movie_title = '';
  String movie_director = '';

  reviewList();

  reviewList.reviewListInfo(this.movie_title, this.movie_director);

  @override
  _reviewListState createState() =>
      _reviewListState(movie_title, movie_director);
}

int add(int num) {
  return num;
}

class _reviewListState extends State<reviewList> {
  String movie_title = '';
  String movie_director = '';
  bool spoilerIstrue = true;
  bool endingAnalysisIstrue = true;

  _reviewListState(this.movie_title, this.movie_director);

  int a = add(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Board',
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFF06292),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.pink[200],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('review')
            .where("movie_title", isEqualTo: movie_title)
            .where("movie_director", isEqualTo: movie_director)
            .snapshots(),
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
              return Card(
                shadowColor: Colors.pink[100],
                elevation: 7,
                margin: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                  Text('level'),
                                ],
                              ),
                            ),
                            SizedBox(width: 140),
                            Container(
                              child: Row(
                                children: [
                                  spoilerIstrue
                                      ? Text(
                                          '스포포함',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        )
                                      : Text(''),
                                  SizedBox(width: 5),
                                  endingAnalysisIstrue
                                      ? Text(
                                          '결말해석',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        )
                                      : Text(''),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(
                            snapshot.data.docs[index]['review_title'],
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          //subtitle: Text(snapshot.data.docs[index]['content']),
                          trailing: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite),
                                    color: Colors.pink[300],
                                    iconSize: 25,
                                    onPressed: () {},
                                  ),
                                ),
                                Text(
                                  "N",
                                  style: TextStyle(
                                      color: Colors.pink[300], fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => showReviewTest(snapshot.data.docs[index]['review_title'], snapshot.data.docs[index]['date_time'], snapshot.data.docs[index]['review_content'])),
                            );
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Row(
                          children: [
                            Container(
                              width: 180,
                              height: 150,
                              child: Text(
                                  snapshot.data.docs[index]['review_brief']),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 140,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.pink[200]
                                /*
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://w.namu.la/s/6542d430faf483de81317c1ad99df450eef28b9409d0adbc02e17ca5c72c99a45ea7435a0b335a109f81d2f169867cec26207c7a2a62d2d216457f17d19735a681b4b9ba7b8ce0fa6407ef5e77928495'),
                                    fit: BoxFit.cover),
                                */
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                // builder: (context) => writeReview(movie_title, movie_director)),
                builder: (context) =>
                    writeReviewTest(movie_title, movie_director)),
          );
        },
        label: const Text(
          '리뷰작성',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.create,
          color: Colors.white,
        ),
        backgroundColor: Colors.pink[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
