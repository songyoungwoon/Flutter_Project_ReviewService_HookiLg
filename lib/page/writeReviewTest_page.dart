import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart' as fq;

import '../screen/my_page.dart';

int a = 0;

class writeReviewTest extends StatefulWidget {
  String movie_title = '';
  String movie_director = '';

  writeReviewTest(this.movie_title, this.movie_director);

  @override
  _writeReviewTestState createState() => _writeReviewTestState(this.movie_title, this.movie_director);
}

class _writeReviewTestState extends State<writeReviewTest> {
  fq.QuillController _controller = fq.QuillController.basic();
  String movie_title = '';
  String movie_director = '';
  String review_title = '';
  String review_brief = '';

  _writeReviewTestState(this.movie_title, this.movie_director);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Write Review",
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'EliceDigitalBaeum'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFF06292)),
          onPressed: () async {
            String result = await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      Icon(Icons.notifications,color: Color(0xFFF06292)),
                      Text(' 확인',style: TextStyle(fontFamily: 'EliceDigitalBaeum'),),
                    ],
                  ),
                  content: Text('작성을 취소하시겠습니까?',style:TextStyle(fontFamily: 'EliceDigitalBaeum')),
                  actions: [
                    FlatButton(
                      child: Text('예',style:TextStyle(fontFamily: 'EliceDigitalBaeum')),
                      onPressed: () {
                        review_title = '';
                        Navigator.of(context).pop('YES');
                        Navigator.of(context).pop('YES');
                      },
                    ),
                    FlatButton(
                      child: Text('아니오',style:TextStyle(fontFamily: 'EliceDigitalBaeum')),
                      onPressed: () {
                        Navigator.of(context).pop('No');
                      },
                    ),
                  ],
                );
              },
            );
            //  Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.photo_album,
              color: Colors.green[200],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.indigo[200],
            ),
            onPressed: () async {
              String result = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Row(
                      children: [
                        Icon(Icons.notifications, color: Color(0xFFF06292)),
                        Text(' 확인',style:TextStyle(fontFamily: 'EliceDigitalBaeum')),
                      ],
                    ),
                    content: Text('저장하시겠습니까?',style:TextStyle(fontFamily: 'EliceDigitalBaeum')),
                    actions: [
                      FlatButton(
                        child: Text('예',style:TextStyle(fontFamily: 'EliceDigitalBaeum')),
                        onPressed: () {
                          // 저장하기
                          var json = jsonEncode(_controller.document.toDelta().toJson());
                          // db 저장
                          /*
                          String imagePath;
                          String name;
                          String email;
                          String about;
                          String nickname;
                          String age;      */
                          final usercol = FirebaseFirestore.instance.collection("review").doc();
                          usercol.set({
                            "movie_title": "$movie_title",
                            "movie_director": "$movie_director",
                            "user_email":my_user.email,
                            "user_name": my_user.name,
                            //"user_level":my_user.level,
                            "user_photo" : my_user.imagePath,
                            "review_title":"$review_title",
                            "review_brief":"$review_brief",
                            "review_content":"$json",
                            "date_time": DateTime.now().toString(),
                          });
                          Navigator.of(context).pop('YES');
                          Navigator.of(context).pop('YES');
                        },
                      ),
                      FlatButton(
                        child: Text('아니오',style:TextStyle(fontFamily: 'EliceDigitalBaeum')),
                        onPressed: () {
                          Navigator.of(context).pop('No');
                        },
                      ),
                    ],
                  );
                },
              );
              //  Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.pink[200],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      '제목',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20,
                          fontFamily: 'EliceDigitalBaeum',
                          ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'EliceDigitalBaeum'
                        ),
                        decoration: InputDecoration(
                          hintText: '제목을 입력하세요.',
                        ),
                        onChanged: (value) {
                          review_title = value;
                        },
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      '간략 소개',
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                      fontFamily: 'EliceDigitalBaeum'),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'EliceDigitalBaeum'
                        ),
                        decoration: InputDecoration(
                          hintText: '간략한 소개를 입력하세요.',
                        ),
                        onChanged: (value) {
                          review_brief = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            fq.QuillToolbar.basic(controller: _controller),
            Expanded(
              child: Container(
                child: fq.QuillEditor.basic(
                  controller: _controller,
                  readOnly: false, // true for view only mode
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
