import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/page/showReview_page.dart';

import 'writeReview_page.dart';

class reviewList extends StatefulWidget {
  String movie_title = '';
  String movie_director = '';

  reviewList();
  reviewList.reviewListInfo(this.movie_title, this.movie_director);

  @override
  _reviewListState createState() => _reviewListState(movie_title, movie_director);
}

class _reviewListState extends State<reviewList> {
  String movie_title = '';
  String movie_director = '';

  _reviewListState(this.movie_title, this.movie_director);

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
          color: Color(0xFFF06292),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.pink[200],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('review').where("movie_title", isEqualTo: movie_title).where("director", isEqualTo: movie_director).snapshots(),
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
                  shadowColor: Colors.pink[100],
                  elevation: 7,
                  margin: EdgeInsets.symmetric(vertical: 13, horizontal:15 ),
                  child:Container(
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
                    title: Text(snapshot.data.docs[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),),
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
            MaterialPageRoute(builder: (context) => writeReview(movie_title, movie_director)),
          );
        },
        label: const Text(
          '리뷰작성',
          style: TextStyle(color: Colors.white, 
          fontSize: 15, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.create,
          color: Colors.white,
        ),
        backgroundColor: Colors.pink[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
