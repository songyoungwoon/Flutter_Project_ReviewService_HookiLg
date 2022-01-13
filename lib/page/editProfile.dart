import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/my_page.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  String changed_name = my_user.name;
  String changed_age = my_user.age;
  String changed_about = my_user.about;
  String changed_imagePath = my_user.imagePath;

  @override
  void update() {}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(40)),
          Text('변경할 이름을 입력하세요.'),
          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              labelText: '이름',
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            onChanged: (value) {
              changed_name = value;
            },
          ),
          Text('변경할 나이를 입력하세요.'),
          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              labelText: '나이',
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            onChanged: (value) {
              changed_age = value;
            },
          ),
          Text('변경할 상태 메세지를 입력하세요.'),
          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              labelText: 'about',
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            onChanged: (value) {
              changed_about = value;
            },
          ),
          Text('프로필 사진을 선택하세요.'),
          IconButton(onPressed: () {}, icon: Icon(Icons.photo)),
          FlatButton(onPressed: () {}, child: Text('저장'))
        ],
      )),
    );
  }
}
