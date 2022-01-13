
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/authentication.dart';
import 'package:fp_review_service_hookilg/screen/Welcome/welcome_screen.dart';
import 'package:fp_review_service_hookilg/widget/numbers_widget.dart';
import 'package:fp_review_service_hookilg/widget/profile_widget.dart';
import 'package:fp_review_service_hookilg/model/user_mypage.dart';

import '../model/user_mypage.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

UserInformation my_user = UserInformation('', '', '', '', '', '');

List<String> titles =<String>[
  '라푼젤의 마법의 머리카락',
  '엄청난 사랑의 결말',
  '날 쏘고 가라',
  '혼자왔어?',
  '가지마...ㅜㅜ',
  '엘사와 안나의.',
  '트롤의 음악으로 하는 세계 대통합',
  '미워할수 없는 악당 로키'
];

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    

    String? useremail = FirebaseAuth.instance.currentUser!.email;

    int num = 0;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.home, color: Colors.pink[300],),
        title:Row(
          children: [
            Expanded(child: SizedBox()),
            IconButton(onPressed: (){
              
            }, icon: Icon(Icons.mode,color: Colors.indigo[300])),
            // SizedBox(width: 5,)
            IconButton(onPressed: (){
              Route route =
                MaterialPageRoute(builder: (context) => WelcomeScreen());
              Navigator.pushReplacement(context, route);

            }, icon: Icon(Icons.logout_outlined, color: Colors.indigo[300],)),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user_info")
            .where('email', isEqualTo: useremail)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("firebase load fail"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("loading"));
          }
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
                SizedBox(height: 30,),
                Row(
                  children: [
                     Expanded(child: SizedBox()),
                    ProfileWidget(
                      
                      imagePath: snapshot.data.docs[index]['imagePath'],
                      onClicked: () async {},
                    ),
                    const SizedBox(height: 24),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 2),
                            buildName(snapshot.data.docs[index]['name']),
                            buildAbout(snapshot.data.docs[index]['about']),

                            const SizedBox(height: 10),
                          ]),
                    ),
                    Expanded(child: SizedBox()),

                  ],
                ),
                const SizedBox(height: 30),
                Container(color: Colors.pink[200],height: 1,width: 380,),
                const SizedBox(height: 10),
                NumbersWidget(),
                const SizedBox(height: 10),
                Container(color: Colors.pink[200],height: 1,width: 380,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text("나의 리뷰",style:TextStyle(
                      fontSize: 20, color: Colors.pink[300], 
                      fontFamily: 'NanumBarun',
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 5,),
                    Icon(Icons.list, color: Colors.pink[300],size: 30,),
                    SizedBox(height: 5,),
                    Expanded(child: SizedBox())
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 200,
                  width: 370,
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        shadowColor: Colors.pink[100],
                        elevation: 4,
                        // margin: EdgeInsets.symmetric(vertical: 14),
                        child: ListTile(
                          title: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.title, color: Colors.amber[600],),
                                SizedBox(width: 5,),
                                Text('${titles[index]}',
                                style:TextStyle(fontWeight: FontWeight.bold,
                                fontFamily: 'NanumBarun') ,
                                )
                              ],
                            ),
                          ),
                        )
                      );
                    }
                    ),
                ),
                SizedBox(height: 200,)
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
                SizedBox(height: 30,),
                Row(
                  children: [
                     Expanded(child: SizedBox()),
                    ProfileWidget(
                      
                      imagePath: '/images/profile.jpg',
                      onClicked: () async {},
                    ),
                    const SizedBox(height: 24),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 2),
                            buildName("Anonymous"),
                            buildAbout("익명의 사용자입니다"),

                            const SizedBox(height: 10),
                          ]),
                    ),
                    Expanded(child: SizedBox()),

                  ],
                ),
                const SizedBox(height: 30),
                Container(color: Colors.pink[200],height: 1,width: 380,),
                const SizedBox(height: 10),
                NumbersWidget(),
                const SizedBox(height: 10),
                Container(color: Colors.pink[200],height: 1,width: 380,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text("나의 리뷰",style:TextStyle(
                      fontSize: 20, color: Colors.pink[300], 
                      fontFamily: 'NanumBarun',
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 5,),
                    Icon(Icons.list, color: Colors.pink[300],size: 30,),
                    SizedBox(height: 5,),
                    Expanded(child: SizedBox())
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 200,
                  width: 370,
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        shadowColor: Colors.pink[100],
                        elevation: 4,
                        // margin: EdgeInsets.symmetric(vertical: 14),
                        child: ListTile(
                          title: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.title, color: Colors.amber[600],),
                                SizedBox(width: 5,),
                                Text('${titles[index]}',
                                style:TextStyle(fontWeight: FontWeight.bold,
                                fontFamily: 'NanumBarun') ,
                                )
                              ],
                            ),
                          ),
                        )
                      );
                    }
                    ),
                ),
                SizedBox(height: 200,)
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.person, color: Colors.amber[600],size: 30,),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, 
              fontSize: 24, fontFamily: 'NanumBarun'),
            ),
          ],
        ),
        const SizedBox(height: 4),
        
      ],
    );
  }



  Widget buildAbout(String name) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              name,
              style: TextStyle(fontSize: 12, height: 1.4, fontFamily: 'NanumBarun'),
            ),
          ],
        ),
      );
}
