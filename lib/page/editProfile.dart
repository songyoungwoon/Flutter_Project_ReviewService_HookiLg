//library
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

//firebase
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//local path
import 'package:fp_review_service_hookilg/page/login/login_page.dart';
import 'package:fp_review_service_hookilg/screen/my_page_test.dart';
import '../screen/my_page.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  String _changed_nickname = user_info.nickname;
  String _changed_about = user_info.about;
  String _changed_birthdate = user_info.birthdate;
  String _changed_imagePath = user_info.imagePath;
  String _changed_backgroundimagePath = user_info.backgoundimagePath;

  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();

  bool isprofilePick = false;
  bool isbackgroundPick = false;

  final ImagePicker _picker = ImagePicker();
  PickedFile? profilePick = null;
  PickedFile? backgroundPick = null;

  @override
  void update() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            // 수정 취소
            if(isprofilePick == true)
              deleteUpload(_changed_imagePath);
            if(isbackgroundPick == true)
              deleteUpload(_changed_backgroundimagePath);

            Navigator.pop(context);
          },
        ),
        actions: [
          // edit profile button
          IconButton(
            icon: Icon(
              Icons.save_outlined,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              // 저장시 DB 처리
              if(_changed_nickname == '') _changed_nickname = user_info.nickname;
              if(_changed_nickname == '') _changed_nickname = user_info.birthdate;

              void updatedata() {
                final usercol = FirebaseFirestore.instance.collection("user_info").doc(user_info.email);
                usercol.update({
                  "nickname": _changed_nickname,
                  "about": _changed_about,
                  "birthdate": _changed_birthdate,
                  "imagePath": _changed_imagePath,
                  "backgroundimagePath": _changed_backgroundimagePath,
                });
              }
              user_info.nickname = _changed_nickname;
              user_info.about = _changed_about;
              user_info.birthdate = _changed_birthdate;
              user_info.imagePath = _changed_imagePath;
              user_info.backgoundimagePath = _changed_backgroundimagePath;

              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              //profile image
              Stack(
                children: [
                  Container(
                    height: 220,
                    padding: EdgeInsets.fromLTRB(20, 120, 20, 20),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(_changed_imagePath),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_changed_backgroundimagePath),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  // edit profile image
                  Positioned(
                    top: 170,
                    left: 210,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt_rounded),
                        color: Colors.black,
                        iconSize: 15,
                        onPressed: () async {
                          return await showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () async {
                                        final image = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        isprofilePick = true;
                                        _changed_imagePath =
                                            await _onProfileImagePickCallback(
                                                File(image!.path));
                                        Navigator.pop(context);
                                      },
                                      child: const Text('사진'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () async {
                                        final image = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        isprofilePick = true;
                                        _changed_imagePath =
                                            await _onProfileImagePickCallback(
                                                File(image!.path));
                                        Navigator.pop(context);
                                      },
                                      child: const Text('카메라'),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),

                  // edit background image
                  Positioned(
                    top: 180,
                    left: 355,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.image_outlined),
                        iconSize: 15,
                        onPressed: () async {
                          return await showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () async {
                                        final image = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        isbackgroundPick = true;
                                        _changed_backgroundimagePath =
                                            await _onBackgroundImagePickCallback(
                                                File(image!.path));

                                        Navigator.pop(context);
                                      },
                                      child: const Text('사진'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () async {
                                        final image = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        isbackgroundPick = true;
                                        _changed_backgroundimagePath =
                                            await _onBackgroundImagePickCallback(
                                                File(image!.path));
                                        Navigator.pop(context);
                                      },
                                      child: const Text('카메라'),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              /*
              TextField(
                    controller: _birthController,
                    style: TextStyle(color: Colors.black),
                    //onChanged: onChanged,
                    cursorColor: Colors.black,
                    decoration: _textFieldDecoration(
                        'birthdate to 8 word', Icons.date_range_rounded),
                  ),

               Text(
                  user_info.nickname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),

               */

              // edit nickname
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomLeft,
                  child: _editTextField('닉네임 : ' + _changed_nickname)),

              // edit about
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomLeft,
                  child: _editTextField('상태 메세지 : ' + _changed_about)),

              // edit birthdate
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomLeft,
                  child: _editTextField('생년월일 : ' + _changed_birthdate)),

              Container(
                color: Colors.grey[200],
                height: 0.5,
                width: 380,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField _editTextField(word) {
    return TextField(
      onChanged: (value) {
        _changed_nickname = value;
      },
      //controller: controller,
      style: TextStyle(color: Colors.black),
      //onChanged: onChanged,
      cursorColor: Colors.black,
      decoration: _textFieldDecoration(word),
    );
  }

  InputDecoration _textFieldDecoration(hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: _textFieldStyle(),
      border: InputBorder.none,
    );
  }

  TextStyle _textFieldStyle() {
    return TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        fontFamily: 'EliceDigitalBaeum');
  }
}

// Renders the image picked by imagePicker from local file storage
// You can also upload the picked image to any server (eg : AWS s3
// or Firebase) and then return the uploaded image URL.
Future<String> _onProfileImagePickCallback(File file) async {
  //FirebaseStorage _storage = FirebaseStorage.instance;
  final firebaseStorageRef = FirebaseStorage.instance
      .ref()
      .child('profile')
      .child('${DateTime.now().millisecondsSinceEpoch}.png');
  final uploadTask = firebaseStorageRef.putFile(
      file, SettableMetadata(contentType: 'image/png'));
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

Future<String> _onBackgroundImagePickCallback(File file) async {
  //FirebaseStorage _storage = FirebaseStorage.instance;
  final firebaseStorageRef = FirebaseStorage.instance
      .ref()
      .child('backgroundImage')
      .child('${DateTime.now().millisecondsSinceEpoch}.png');
  final uploadTask = firebaseStorageRef.putFile(
      file, SettableMetadata(contentType: 'image/png'));
  await uploadTask.whenComplete(() => null);
  final downloadUrl = await firebaseStorageRef.getDownloadURL();

  return downloadUrl;
}

void deleteUpload(String url) {
  final firebaseStorageRef = FirebaseStorage.instance.refFromURL(url).delete();
}
