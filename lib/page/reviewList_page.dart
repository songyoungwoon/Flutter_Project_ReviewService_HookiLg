// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/page/showReview_page.dart';

import 'writeReview_page.dart';
import '../main.dart';

class reviewList extends StatefulWidget {
  const reviewList({Key? key}) : super(key: key);

  @override
  _reviewListState createState() => _reviewListState();
}

class _reviewListState extends State<reviewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Board',
        style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
          color: Colors.pinkAccent,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Center(
            child: IconButton(
              icon: Icon(Icons.home, color: Colors.pinkAccent,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
                   
      
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        shadowColor: Colors.white24,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('review').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("firebase load fail"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("loading"));
          }

          return
            ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 7,
                  margin: EdgeInsets.symmetric(vertical: 13, horizontal:15 ),
                  child:Container(
                    // height: 80,
                    child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showReview(
                                snapshot.data.docs[index]['title'],
                                snapshot.data.docs[index]['content'])),
                      );
                    },
                    leading: Container(child: Icon(Icons.circle, color: Colors.amber[600],),),
                    title: Text(snapshot.data.docs[index]['title']),
                    // subtitle: Text(snapshot.data.docs[index]['content']),
                    trailing: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite, color: Colors.pink[300],),
                          Text("N", style: TextStyle(
                            color: Colors.pink[300],
                            fontSize: 10
                          ),)                           
                        ],),
                    ),
                              

                ),
                  ),);
              },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => writeReview()),
          );
        },
        label: const Text(
          '리뷰작성',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        icon: const Icon(
          Icons.create,
          color: Colors.white,
        ),
        backgroundColor: Colors.pink[200],
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void createdata(String code, String name, String status) {
  final usercol = FirebaseFirestore.instance.collection("players").doc("$code");
  usercol.set({
    "name": "$name",
    "status": "$status",
  });
}

void readdata(String code) {
  final usercol = FirebaseFirestore.instance.collection("players").doc("$code");
  usercol.get().then((value) => {print(value.data())});
}

void updatedata(String code, String status) {
  final usercol = FirebaseFirestore.instance.collection("players").doc("$code");
  usercol.update({
    "status": "$status",
  });
}

void deleteData() {
  final usercol = FirebaseFirestore.instance.collection("review").doc();
  usercol.delete();
}
