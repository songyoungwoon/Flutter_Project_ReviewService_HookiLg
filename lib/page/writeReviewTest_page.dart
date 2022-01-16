//library
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as fq;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

//local path
import '../screen/my_page.dart';

int a = 0;

class writeReviewTest extends StatefulWidget {
  String movie_title = '';
  String movie_director = '';

  writeReviewTest(this.movie_title, this.movie_director);

  @override
  _writeReviewTestState createState() =>
      _writeReviewTestState(this.movie_title, this.movie_director);
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
          "리뷰 작성",
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'EliceDigitalBaeum'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black26),
          onPressed: () async {
            String result = await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      Icon(Icons.notifications, color: Color(0xFFF06292)),
                      Text(
                        ' 확인',
                        style: TextStyle(fontFamily: 'EliceDigitalBaeum'),
                      ),
                    ],
                  ),
                  content: Text('작성을 취소하시겠습니까?',
                      style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                  actions: [
                    FlatButton(
                      child: Text('예',
                          style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                      onPressed: () {
                        review_title = '';
                        Navigator.of(context).pop('YES');
                        Navigator.of(context).pop('YES');
                      },
                    ),
                    FlatButton(
                      child: Text('아니오',
                          style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
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
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black38,
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
                        Text(' 확인',
                            style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                      ],
                    ),
                    content: Text('저장하시겠습니까?',
                        style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                    actions: [
                      FlatButton(
                        child: Text('예',
                            style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
                        onPressed: () {
                          // 저장하기
                          var json = jsonEncode(
                              _controller.document.toDelta().toJson());
                          // db 저장
                          /*
                          String imagePath;
                          String name;
                          String email;
                          String about;
                          String nickname;
                          String age;      */
                          final usercol = FirebaseFirestore.instance
                              .collection("review")
                              .doc();
                          usercol.set({
                            "movie_title": "$movie_title",
                            "movie_director": "$movie_director",
                            "user_email": my_user.email,
                            "user_name": my_user.name,
                            //"user_level":my_user.level,
                            "imagePath": my_user.imagePath,
                            "review_title": "$review_title",
                            "review_brief": "$review_brief",
                            "review_content": "$json",
                            "date_time": DateTime.now().toString(),
                          });
                          Navigator.of(context).pop('YES');
                          Navigator.of(context).pop('YES');
                        },
                      ),
                      FlatButton(
                        child: Text('아니오',
                            style: TextStyle(fontFamily: 'EliceDigitalBaeum')),
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
        elevation: 0,
      ),
      body: Container(
        //color: Colors.white,
        child: Container(
          child: Column(
            children: [
              // title section
              Padding(padding: EdgeInsets.only(top: 20)),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    autofocus: true,
                    style: TextStyle(
                        fontSize: 16, fontFamily: 'EliceDigitalBaeum'),
                    decoration: InputDecoration(
                      hintText: '제목을 입력하세요.',
                    ),
                    onChanged: (value) {
                      review_title = value;
                    },
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),

              // brief section
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'EliceDigitalBaeum'),
                    decoration: InputDecoration(
                      hintText: '간략한 소개를 입력하세요.',
                    ),
                    onChanged: (value) {
                      review_brief = value;
                    },
                  ),
                ),
              ),

              // content section
              Container(
                child: fq.QuillToolbar.basic(
                    onImagePickCallback: _onImagePickCallback,
                    onVideoPickCallback: _onVideoPickCallback,
                    showCodeBlock: false,
                    showLink: false,
                    showIndent: false,
                    showHistory: false,
                    multiRowsDisplay: false,
                    toolbarSectionSpacing: 0,
                    showClearFormat: false,
                    showAlignmentButtons: true,
                    showCameraButton: true,
                    controller: _controller),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: fq.QuillEditor.basic(
                    controller: _controller,
                    readOnly: false, // true for view only mode
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Renders the image picked by imagePicker from local file storage
  // You can also upload the picked image to any server (eg : AWS s3
  // or Firebase) and then return the uploaded image URL.
  Future<String> _onImagePickCallback(File file) async {
    //FirebaseStorage _storage = FirebaseStorage.instance;
    final firebaseStorageRef = FirebaseStorage.instance.ref().child('content_images').child('${DateTime.now().millisecondsSinceEpoch}.png');
    final uploadTask = firebaseStorageRef.putFile(file, SettableMetadata(contentType: 'image/png'));
    await uploadTask.whenComplete(() => null);
    final downloadUrl = await firebaseStorageRef.getDownloadURL();

    return downloadUrl;
    // Copies the picked file from temporary cache to applications directory
    /*
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
    await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
    */
  }

  Future<String> _onVideoPickCallback(File file) async {
    // Copies the picked file from temporary cache to applications directory
    final firebaseStorageRef = FirebaseStorage.instance.ref().child('content_video').child('${DateTime.now().millisecondsSinceEpoch}.mp4');
    final uploadTask = firebaseStorageRef.putFile(file, SettableMetadata(contentType: 'video/mp4'));
    await uploadTask.whenComplete(() => null);
    final downloadUrl = await firebaseStorageRef.getDownloadURL();

    return downloadUrl;

    /*
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
    await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile.path.toString();
    */
  }

}
