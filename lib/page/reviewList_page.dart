// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fp_review_service_hookilg/screen/Welcome/welcome_screen.dart';

import 'package:fp_review_service_hookilg/screen/my_page.dart';
import 'package:fp_review_service_hookilg/widget/profile_widget.dart';

// import 'writeReview_page.dart';
import 'writeReviewTest_page.dart';

// import 'showReview_page.dart';
import 'showReviewTest_page.dart';
import '../screen/fristhome.dart';

class reviewList extends StatefulWidget {
  String movie_title = '';
  String movie_director = '';

  //reviewList();
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
  bool thumbnailIstrue = false;

  _reviewListState(this.movie_title, this.movie_director);

  int a = add(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Review Board',
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 26,
              fontFamily: 'EliceDigitalBaeum'),
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
        actions: [
          Center(
            child: IconButton(
              icon: Icon(Icons.home, color: Colors.indigo[200]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstHome()),
                );
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.pink[200],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('review')
            .where("movie_title", isEqualTo: movie_title)
            .where("movie_director", isEqualTo: movie_director)
            .snapshots(),
        // snapshot.data.docs[index]['title'],
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
              //method
              MaterialPageRoute gotoShowReview() {
                return MaterialPageRoute(
                    builder: (context) => showReviewTest(
                        snapshot.data.docs[index]['review_title'],
                        snapshot.data.docs[index]['date_time'],
                        snapshot.data.docs[index]['review_content']));
              }

              // 리뷰 유저 정보 받아와야됨
              return Card(
                elevation: 0,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                child: Container(
                  child: Column(
                    children: [
                      // user profile
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  snapshot.data.docs[index]['imagePath']),
                              backgroundColor: Colors.amber[600],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data.docs[index]['user_name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: 'NanumBarun'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Lv',
                                    style: TextStyle(
                                        fontSize: 10, fontFamily: 'NanumBarun'),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    snapshot.data.docs[index]['date_time'],
                                    style: TextStyle(fontSize: 8),
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                  spoilerIstrue
                                      ? Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              size: 6,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              '스포포함',
                                              style: TextStyle(fontSize: 8),
                                            )
                                          ],
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // line
                      Container(
                        width: 350,
                        height: 0.1,
                        color: Colors.grey,
                      ),

                      // review title
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            child: Text(
                              snapshot.data.docs[index]['review_title'],
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(context, gotoShowReview());
                            },
                          )),


                      // review brief
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            child: Text(
                              snapshot.data.docs[index]['review_brief'],
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.push(context, gotoShowReview());
                            },
                          )),


                      Padding(padding: EdgeInsets.only(top: 10)),
                      // review image
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          print(my_user.email);
          if (my_user.email != '') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  // builder: (context) => writeReview(movie_title, movie_director)),
                  builder: (context) =>
                      writeReviewTest(movie_title, movie_director)),
            );
          } else {
            String result = await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      Icon(Icons.notifications, color: Color(0xFFF06292)),
                      Text(' 확인',
                          style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                    ],
                  ),
                  content: Text('로그인 후 이용하세요.',
                      style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                  actions: [
                    FlatButton(
                      child: Text('로그인',
                          style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // builder: (context) => writeReview(movie_title, movie_director)),
                              builder: (context) => WelcomeScreen()),
                        );
                      },
                    ),
                    FlatButton(
                      child: Text('취소',
                          style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                      onPressed: () {
                        Navigator.of(context).pop('No');
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        label: const Text(
          '리뷰작성',
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'NanumBarun'),
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

void deleteData() {
  final usercol = FirebaseFirestore.instance.collection("review").doc();
  usercol.delete();
}
