//library
import 'package:flutter/material.dart';

//local path
import '../page/editProfile.dart';
import '../page/login/login_page.dart';
import '../page/login/authentication.dart';

class myPageTest extends StatefulWidget {
  const myPageTest({Key? key}) : super(key: key);

  @override
  _myPageTestState createState() => _myPageTestState();
}

class _myPageTestState extends State<myPageTest> {
  bool isEntireTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          // edit profile button
          IconButton(
            icon: Icon(
              Icons.mode,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => editProfile()),
              );
            },
          ),

          //logout button
          IconButton(
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              //my_user.clearUser();
              AuthenticationHelper().signOut();
              Route route = MaterialPageRoute(builder: (context) => Login());
              Navigator.pushReplacement(context, route);
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
              Container(
                height: 220,
                padding: EdgeInsets.fromLTRB(20, 120, 20, 20),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user_info.imagePath),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(user_info.backgoundimagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // nickname
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                child: Text(
                  user_info.nickname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),

              // level follower following
              Container(
                color: Colors.grey[200],
                height: 0.5,
                width: 380,
              ),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(user_info.level.toString() + ' ' + 'Lv')),
                  ),
                  Container(
                    color: Colors.grey[200],
                    height: 50,
                    width: 0.5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text((user_info.follower.length - 1).toString() +
                          ' ' +
                          '팔로워'),
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    height: 50,
                    width: 0.5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text((user_info.following.length - 1).toString() +
                          ' ' +
                          '팔로잉'),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                color: Colors.grey[200],
                height: 0.5,
                width: 380,
              ),

              // entire of category button
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      child: Text('전체'),
                      onPressed: () {
                        isEntireTrue = true;
                      },
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: 0.5,
                    height: 30,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      child: Text('분류'),
                      onPressed: () {
                        isEntireTrue = false;
                      },
                    ),
                  )
                ],
              ),

              // entire content  or  my category
              isEntireTrue
                  ? Container(
                      height: 40,
                      color: Colors.red,
                    )
                  : Container(
                      height: 40,
                      color: Colors.blue,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
