import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/page/searchResult_page.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'text_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

class HomePage2 extends StatefulWidget {
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
  bool isFace = false;
  bool isPose = false;
  ui.Image? _image;
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
                  movTitle = snapshot.data.toString();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => searchResult(movTitle)),
                  );
                } else {
                  return Text('Text Recogniation Ready');
                }
                return Text('');
              },
            )
          ],
        ),
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
    if (recognisedText.text == ' ' || recognisedText.text == '\n'){}
    else
    movTitle = movTitle + recognisedText.text;
    streamController.add(movTitle);
    temp = recognisedText.text;
    return recognisedText.text;
  }



  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then((value) => setState(() {
      _image = value;
    }));
  }
}
