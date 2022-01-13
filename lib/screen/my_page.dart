import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/authentication.dart';
import 'package:fp_review_service_hookilg/screen/Welcome/welcome_screen.dart';
import 'package:fp_review_service_hookilg/widget/appbar_widget.dart';
import 'package:fp_review_service_hookilg/widget/button_widget.dart';
import 'package:fp_review_service_hookilg/widget/numbers_widget.dart';
import 'package:fp_review_service_hookilg/widget/profile_widget.dart';
import 'package:fp_review_service_hookilg/model/user_mypage.dart';

import '../model/user_mypage.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

UserInformation my_user = UserInformation('', '', '', '', '', '');

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // final user = UserPreferences.myUser;

    // var currentUser = FirebaseAuth.instance.currentUser;

    String? useremail = FirebaseAuth.instance.currentUser!.email;
    /*
    @override
    void initState() async{
      super.initState();
      var data = await FirebaseFirestore.instance.collection("user_info").where('email', isEqualTo : useremail).snapshots().first;
      print(data);
    }

    initState();
*/  int num = 0;
    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user_info")
            .where('email', isEqualTo: useremail)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(isLogin) {
            my_user.setUserInfo(
                snapshot.data.docs[num]['imagePath'],
                snapshot.data.docs[num]['name'],
                snapshot.data.docs[num]['email'],
                snapshot.data.docs[num]['about'],
                snapshot.data.docs[num]['nickname'],
                snapshot.data.docs[num]['age']);
          } else {
            my_user.setUserInfo(
                '/images/profile.jpg',
                'anonymous',
                'anonymous@gmail.com',
                'anonymous',
                'anonymous',
                'anonymous');
          }

          if(isLogin) {
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (ctx, index) {
                return Container(
                    child: Column(
                      children:
                      [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileWidget(
                              imagePath: snapshot.data.docs[index]['imagePath'],
                              onClicked: () async {},
                            ),
                            const SizedBox(height: 24),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 2),
                                  buildName(snapshot.data.docs[index]['name']),
                                  const SizedBox(height: 10),
                                  Center(child: buildProfileModifyButton()),
                                ]),
                          ],
                        ),
                        const SizedBox(height: 30),
                        NumbersWidget(),
                        const SizedBox(height: 24),
                        // buildMyReviewButton(),
                        const SizedBox(height: 48),
                        buildAbout(snapshot.data.docs[index]['about']),
                      ],
                    ));
              },
            );
          }
          else {
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (ctx, index) {
                return Container(
                    child: Column(
                      children:
                      [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileWidget(
                              imagePath: '/images/profile.jpg',
                              onClicked: () async {},
                            ),
                            const SizedBox(height: 24),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 2),
                                  buildName('anonymous'),
                                  const SizedBox(height: 10),
                                  Center(child: buildProfileModifyButton()),
                                ]),
                          ],
                        ),
                        const SizedBox(height: 30),
                        NumbersWidget(),
                        const SizedBox(height: 24),
                        // buildMyReviewButton(),
                        const SizedBox(height: 48),
                        buildAbout('anonymous'),
                      ],
                    ));
              },
            );
          }
        },
      ),
    );
  }

  Widget buildName(String name) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          '나의 한줄 소개를 적어주세요!',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        )
      ],
    );
  }

  Widget buildProfileEditButton() => ButtonWidget(
        text: '프로필 수정',
        isBold: true,
        onClicked: () {},
      );

  Widget buildProfileModifyButton() => ButtonWidget(
        text: 'log out',
       isBold: true,
        onClicked: () {
          FirebaseAuth.instance.signOut();
          Route route =
              MaterialPageRoute(builder: (context) => WelcomeScreen());
          Navigator.pushReplacement(context, route);
        },
      );

  Widget buildAbout(String name) => Container(
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
              name,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
