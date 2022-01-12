import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/authentication.dart';
import 'package:fp_review_service_hookilg/screen/Welcome/welcome_screen.dart';
import 'package:fp_review_service_hookilg/widget/appbar_widget.dart';
import 'package:fp_review_service_hookilg/widget/button_widget.dart';
import 'package:fp_review_service_hookilg/widget/numbers_widget.dart';
import 'package:fp_review_service_hookilg/widget/profile_widget.dart';
import 'package:fp_review_service_hookilg/model/user_mypage.dart';
import 'package:fp_review_service_hookilg/utils/user_preferences.dart';


class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row ( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children :[
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          Column( crossAxisAlignment: CrossAxisAlignment.center,
            children :[
          const SizedBox(height: 2),
          buildName(user),
          const SizedBox(height: 10),
          Center(child: buildProfileEditButton()),
          ]
          ),
          ],
          ),
          const SizedBox(height: 30),
          NumbersWidget(),
          const SizedBox(height: 24),
          buildlogoutButton(),
          const SizedBox(height: 48),
          buildAbout(user),

        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            '나의 한줄 소개',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          )
        ],
      );

  Widget buildProfileEditButton() => ButtonWidget(
        text: '프로필 수정',
        isBold: true,
        onClicked: () {},
      );
    Widget buildlogoutButton() => ButtonWidget(
        text: 'log out',
        isBold: true,
        onClicked: () {
          Route route = MaterialPageRoute(builder: (context) => WelcomeScreen());
          Navigator.pushReplacement(
            context, route
          );
        },
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
