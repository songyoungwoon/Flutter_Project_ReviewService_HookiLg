import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quill/flutter_quill.dart' as fq;
import 'package:contentful_rich_text/contentful_rich_text.dart';

import '../widget/writeText.dart';

class showReviewTest extends StatefulWidget {
  String review_title = '';
  String date_time = '';
  String review_content = '';

  showReviewTest(this.review_title, this.date_time, this.review_content);

  @override
  _showReviewTestState createState() => _showReviewTestState(
      this.review_title, this.date_time, this.review_content);
}

class _showReviewTestState extends State<showReviewTest> {
  String review_title = '';
  String date_time = '';
  String review_content = '';

  fq.QuillController _controller = fq.QuillController.basic();
  bool ItsMine = false;
  bool isEdit = false;

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
      appBar: AppBar(
        title: Text(
          "Review",
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 25,
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
          ItsMine
              ? IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Color(0xFFF06292),
                  ),
                  onPressed: () {},
                )
              : Text(''),
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.pink[200],
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
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(children: [
                                Text('name',style: TextStyle(
                                  fontFamily: 'NanumBarun',
                                  fontSize: 19,
                                ),),
                                SizedBox(height: 5,),
                                Text('level',style: TextStyle(
                                  fontFamily: 'NanumBarun',
                                  fontSize: 13
                                ),),
                              ]),
                            ),
                            SizedBox(width: 120),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black12, width: 1.0)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          snapshot.data.docs[index]['review_title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20,
                              fontFamily: 'NanumBarun'),
                        ),
                      ),
                      Visibility(
                          visible: isEdit,
                          child:
                              fq.QuillToolbar.basic(controller: _controller)),
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
                      )
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
