import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'name',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 140,
              height: 0.5,
              color: Colors.white,
            ),

            Container(
              padding: EdgeInsets.only(top: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.sell_sharp, color: Colors.amber[600],
                              size: 14,),
                              SizedBox(width: 2,),
                              Text('mbti',style: TextStyle(
                                color: Colors.amber[700]
                              ),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),

                      Row(
                        children: [
                          Icon(Icons.person_sharp, color: Colors.amber[600],
                          size: 14,),
                          SizedBox(width: 2,),
                          Text('age',style: TextStyle(
                                color: Colors.amber[700])),
                        ],
                      ),
                    ],
                  ),
                ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  color: Colors.pink[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        '프로필 수정',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  color: Colors.pink[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        '프로필 수정',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
