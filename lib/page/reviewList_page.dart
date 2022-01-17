//library
// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//local path
import 'package:fp_review_service_hookilg/screen/Welcome/welcome_screen.dart';
import 'package:fp_review_service_hookilg/screen/my_page.dart';
import 'package:fp_review_service_hookilg/widget/profile_widget.dart';

// import 'writeReview_page.dart';
import 'writeReviewTest_page.dart';

// import 'showReview_page.dart';
import 'showReviewTest_page.dart';
import '../screen/fristhome.dart';
import 'login/login_page.dart';
import '../page/login/authentication.dart';

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

  bool _isChecked = false;
  final _valueList = ['인기순', '최신순'];
  var _selectedValue = '인기순';

  // writer info
  String writer_nickname = '';
  int writer_level = 0;
  String writer_imagePath = '';

  _reviewListState(this.movie_title, this.movie_director);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Review',
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
              fontSize: 15,
              fontFamily: 'EliceDigitalBaeum'),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black26,
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
            //.orderBy('date_time')
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
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (ctx, index) {
              //Routing method
              MaterialPageRoute gotoShowReview() {
                return MaterialPageRoute(
                    builder: (context) => showReviewTest(
                        snapshot.data.docs[index]['review_title'],
                        snapshot.data.docs[index]['date_time'],
                        snapshot.data.docs[index]['review_content']));
              }

              // 리뷰 유저 정보 받아와야됨
              void readdata() async {
                final usercol = await FirebaseFirestore.instance
                    .collection("user_info")
                    .doc(snapshot.data.docs[index]['user_email'])
                    .get()
                    .then((value) => {
                          writer_nickname = value['nickname'],
                          writer_level = value['level'],
                          writer_imagePath = value['imagePath']
                        });
              }
              readdata();

              // arrange bar boolean
              bool isFirstTrue = false;
              if (index == 0) {
                isFirstTrue = true;
              }
              return Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    // arrange dropdown
                    isFirstTrue
                        ? Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    children: [
                                      Positioned(
                                        bottom: 35,
                                        right: 18,
                                        child: Text(
                                          '스포방지',
                                          style: TextStyle(fontSize: 7),
                                        ),
                                      ),
                                      Switch(
                                        value: _isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _isChecked = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  DropdownButton(
                                      value: _selectedValue,
                                      items: _valueList.map(
                                        (value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedValue = value.toString();
                                        });
                                      }),
                                ],
                              ),
                            ),
                          )
                        : Container(),

                    // review list
                    Card(
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
                                    backgroundImage:
                                        NetworkImage(writer_imagePath),
                                    backgroundColor: Colors.grey,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          writer_nickname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              fontFamily: 'NanumBarun'),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          writer_level.toString() + 'Lv',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'NanumBarun'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot.data.docs[index]['date_time']
                                              .toDate()
                                              .toString(),
                                          style: TextStyle(fontSize: 8),
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        snapshot.data.docs[index]
                                                ['review_spoiler']
                                            ? Row(
                                                children: [
                                                  Icon(
                                                    Icons.circle,
                                                    size: 6,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    '스포포함',
                                                    style:
                                                        TextStyle(fontSize: 8),
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
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, gotoShowReview());
                                  },
                                )),


                            // review image
                            Container(
                              height: 100,
                              color: Colors.white,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount:
                                snapshot.data.docs[index]['review_images'].length,
                                itemBuilder: (context, i) {
                                  return Row(
                                    children: [
                                      Image(
                                        image: NetworkImage(snapshot.data.docs[index]
                                        ['review_images'][i]),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              );
            },
          );
        },
      ),

      // review create button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (isLogin == true) {
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
                              builder: (context) => Login()),
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
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'NanumBarun'),
        ),
        icon: const Icon(
          Icons.create,
          color: Colors.redAccent,
          size: 12,
        ),
        backgroundColor: Colors.white,
        hoverColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

void deleteData() {
  final usercol = FirebaseFirestore.instance.collection("review").doc();
  usercol.delete();
}
