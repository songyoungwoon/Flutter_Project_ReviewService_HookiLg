
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
String anonymousImgPath ='https://firebasestorage.googleapis.com/v0/b/reviewservicehookilg.appspot.com/o/profile.jpg?alt=media&token=f76f7985-5f5d-44d1-8689-f507c41558aa';

List<String> titles =<String>[
  '기생충 영화 해석 및 후기',
  '고요의 바다 속 숨겨진 연출을 알아보자',
  '영화 특종의 결말해석',
  '그 해 여름 밤의, 너를 기억한다',
  '오감의 끝이 몽환에 감싸여있다',
  '나는 너와 다른 사람이 되고 말거야',
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
        title:Row(
          children: [
            Expanded(child: SizedBox()),
            IconButton(onPressed: (){
              
            }, icon: Icon(Icons.mode,color: Colors.pink[300])),
            // SizedBox(width: 5,)
            IconButton(onPressed: (){
              Route route =
                MaterialPageRoute(builder: (context) => WelcomeScreen());
              Navigator.pushReplacement(context, route);

            }, icon: Icon(Icons.logout_outlined, color: Colors.pink[300],)),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user_info")
            .where('email', isEqualTo: useremail)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
            my_user.setUserInfo(
                snapshot.data.docs[num]['imagePath'],
                snapshot.data.docs[num]['name'],
                snapshot.data.docs[num]['email'],
                snapshot.data.docs[num]['about'],
                snapshot.data.docs[num]['nickname'],
                snapshot.data.docs[num]['age']);
         


          if(isLogin) {
            return ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx, index) => buildUserInfo(
                snapshot.data.docs[index]['imagePath'],
                snapshot.data.docs[index]['name'],
                snapshot.data.docs[index]['about']
              ),

              );
          }
          else {
            return ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx, index) => buildUserInfo(anonymousImgPath,'Anonymous','익명의 사용자 입니다.'),

              );
          }
        },
      ),
    );
  }



Widget buildUserInfo(String imgPath, String userName, String shortSen){
  return Container(
                child: Column(
                children:
              [
                SizedBox(height: 30,),
                Row(
                  children: [
                     Expanded(child: SizedBox()),
                    ProfileWidget(
                      
                      imagePath: imgPath,
                      onClicked: () async {},
                    ),
                    const SizedBox(height: 24),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 2),
                            buildName(userName),
                            buildAbout(shortSen),

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