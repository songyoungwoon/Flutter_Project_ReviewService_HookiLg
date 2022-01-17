import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quill/flutter_quill.dart' as fq;

class showReviewTest extends StatefulWidget {
  String review_title = '';
  Timestamp date_time;
  String review_content = '';

  showReviewTest(this.review_title, this.date_time, this.review_content);

  @override
  _showReviewTestState createState() => _showReviewTestState(
      this.review_title, this.date_time, this.review_content);
}

class _showReviewTestState extends State<showReviewTest> {
  String review_title = '';
  Timestamp date_time;
  String review_content = '';
  int index = 0;

  fq.QuillController _controller = fq.QuillController.basic();
  bool ItsMine = false;
  bool isEdit = false;

  // writer info
  String writer_nickname= '';
  int writer_level = 0;
  String writer_imagePath = '';

  _showReviewTestState(this.review_title, this.date_time, this.review_content);

  @override
  void initState() {
    super.initState();
    var myJSON = jsonDecode(review_content);
    _controller = fq.QuillController(
        document: fq.Document.fromJson(myJSON),
        selection: TextSelection.collapsed(offset: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Review",
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
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
          ItsMine
              ? IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black26,
                  ),
                  onPressed: () {},
                )
              : Text(''),
          IconButton(icon: Icon(Icons.ios_share), color: Colors.black38, onPressed: () {}),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('review')
            .where('review_title', isEqualTo: review_title)
            .where('date_time', isEqualTo: date_time)
            .snapshots(),
        builder: (BuildContext contex, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("firebase load fail"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("loading"));
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
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              writer_imagePath),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Column(children: [
                            Text(
                              writer_nickname,
                              style: TextStyle(
                                fontFamily: 'NanumBarun',
                                fontSize: 19,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.5),
                            ),
                            Text(writer_level.toString()+
                              'Lv',
                              style: TextStyle(
                                  fontFamily: 'NanumBarun', fontSize: 13),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    height: 0.3,
                    color: Colors.grey,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      snapshot.data.docs[index]['review_title'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'NanumBarun'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                  ),
                  Visibility(
                      visible: isEdit,
                      child: fq.QuillToolbar.basic(controller: _controller)),
                  Container(
                    margin: EdgeInsets.only(bottom: 110),
                    child: fq.QuillEditor(
                      controller: _controller,
                      readOnly: !isEdit,
                      expands: false,
                      scrollController: ScrollController(),
                      autoFocus: isEdit,
                      scrollable: true,
                      focusNode: FocusNode(),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.comment_outlined), onPressed: () {}),
            Spacer(),
            IconButton(
              icon: Icon(Icons.favorite_outline_sharp),
              onPressed: () {},
            ),
            Text('5'),
            Padding(padding: EdgeInsets.all(5)),
          ],
        ),
      ),
    );
  }
}
