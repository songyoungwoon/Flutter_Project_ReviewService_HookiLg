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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 10,),
          Row(children: [
            Expanded(child: SizedBox()),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.more_vert_outlined, color: Colors.pink[300],)),
            SizedBox(width: 7,)
          ],
          ),
          // SizedBox(height: 50,),
          Row ( //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children :[
          SizedBox(width: 45,),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          SizedBox(width: 30,),
          Container (
            padding: EdgeInsets.fromLTRB(5, 15, 10, 15),
            child: Column( //mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center,
              children :[
            const SizedBox(height: 10),
            buildName(user),
            SizedBox(height: 5,),
            Container(
              height: 19,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                shadowColor: Colors.indigo[200],
                onPrimary: Colors.indigo[300],
                primary: Colors.pink[50],
                ),
                onPressed: (){

              }, child: Text('프로필 수정',style: TextStyle(fontWeight:FontWeight.bold, fontFamily: 'EliceDigitalBaeum'))),
            ),
            const SizedBox(height: 5),
            ]
            ),
          ),
          ],
          ),
          const SizedBox(height: 30),
          NumbersWidget(),
          const SizedBox(height: 24),
          Container(color: Colors.red, height: 1,),
          const SizedBox(height: 48),
          buildAbout(user),
          const SizedBox(height:120,),
          Container(child:Row(
            children: [
            // Expanded(child:SizedBox())
            SizedBox(width: 280,),
            buildlogoutButton()
          ],),
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'EliceDigitalBaeum'),
          ),
          const SizedBox(height: 4),
          Text(
            '나의 한줄 소개',
            style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'EliceDigitalBaeum'),
          )
        ],
      );

 
    Widget buildlogoutButton() => ButtonWidget(
        text: 'logout',
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
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
