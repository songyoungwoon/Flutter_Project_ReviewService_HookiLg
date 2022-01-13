import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../page/searchResult_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/page/searchResult_page.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import '../page/text_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

String _searchText = "";

class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  final TextEditingController _filter = TextEditingController();

  FocusNode focusNode = FocusNode();
  bool isFocusNodeTrue = false;
  bool isFocusOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
      height: 72,
      width: 500,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              onSubmitted: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchResult(value)),
                );
              },
              focusNode: focusNode,
              style: TextStyle(
                fontSize: 12,
              ),
              autofocus: false,
              controller: _filter,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueAccent[99],
                prefixIcon: focusNode.hasFocus
                    ? TextButton(
                        child: Text(
                          '취소',
                          style: TextStyle(fontFamily: 'NanumBarun'),
                        ),
                        onPressed: () {
                          setState(() {
                            _filter.clear();
                            _searchText = "";
                            focusNode.unfocus();
                          });
                        },
                      )
                    : Icon(Icons.search, color: Colors.pink[300], size: 20),
                suffixIcon: focusNode.hasFocus
                    ? IconButton(
                        icon:
                            Icon(Icons.cancel, color: Colors.black26, size: 20),
                        onPressed: () {
                          setState(() {
                            _filter.clear();
                            _searchText = "";
                          });
                        },
                      )
                    : Text(''),
                hintText: '리뷰나 해석을 보고싶은 영화를 검색하세요.',
                hintStyle: TextStyle(fontFamily: 'EliceDigitalBaeum'),
                labelStyle: TextStyle(
                  color: Colors.black12,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class MLPage extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return CameraWidgetState();
  }
}

class CameraWidgetState extends State {
  PickedFile? imageFile = null;
  StreamController<String> streamController = StreamController<String>();
  StreamController<String> poseStreamController = StreamController<String>();
  String? tp;
  String? temp;
  List? pose_x;
  List? pose_y;
  String movTitle = '';
  File? _uploadImg;
  List<Pose>? _poses;
  List<Face>? _faces;
  String? pos;
  CustomPaint? customPaint;
  List? keyWords;
  bool isFace = false;
  bool isPose = false;
  ui.Image? _image;
  List<String> ml_search = [''];

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SWF ML Tutorial"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: (imageFile == null)
                  ? Text("Choose Image")
                  : Image.file(File(imageFile!.path)),
            ),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.lightBlueAccent,
              onPressed: () {
                _showChoiceDialog(context);
              },
              child: Text("Select Image"),
            ),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.lightBlueAccent,
              onPressed: () {
                setState(() {
                  getText(imageFile!);
                });
              },
              child: Text("Text Recognition"),
            ),
            StreamBuilder(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ml_search.add(snapshot.data.toString());
                } else {
                  return Text('Text Recogniation Ready');
                }
                return Text('');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            // builder: (context) => writeReview(movie_title, movie_director)),
              builder: (context) =>
                  searchResult(keyWords![0])),
          );
        },
        label: const Text(
          '사진으로 검색',
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'NanumBarun'),
        ),
        icon: const Icon(
          Icons.photo,
          color: Colors.white,
        ),
        backgroundColor: Colors.pink[300],
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _uploadImg = File(pickedFile!.path);
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  Future<String> getText(PickedFile img) async {
    final inputImage = InputImage.fromFile(File(img.path));
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);
    keyWords = recognisedText.text.split('\n');
    return recognisedText.text;
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then((value) => setState(() {
          _image = value;
        }));
  }
}
