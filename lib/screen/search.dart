//library
import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/page/textrecognition.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';

//local path
import '../widget/search_bar.dart';
import '../page/reviewList_page.dart';
import '../page/searchResult_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final ImagePicker _picker = ImagePicker();
  PickedFile? _image;

  Future getImageFromGallery() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(12)),
                    searchBar(),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          /*
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          */
                          SizedBox(width: 5),
                          Text('인기 영화',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'EliceDigitalBaeum',
                                  fontSize: 17)),
                        ],
                      ),
                    ),
                    Container(
                      height: 800,
                      color: Colors.white,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('search_word')
                              .orderBy('count', descending: true)
                              .limit(10)
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("firebase load fail"),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: Text("loading"));
                            }
                            return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (ctx, index) {
                                return Container(
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  height: 40,
                                  child: TextButton(
                                    child: Text(
                                      (index + 1).toString() +
                                          ".   " +
                                          snapshot.data.docs[index]['word'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'EliceDigitalBaeum',
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    onPressed: () {
                                      final usercol = FirebaseFirestore.instance
                                          .collection("search_word")
                                          .doc(snapshot.data.docs[index]['word']);
                                      var data = usercol.get().then((value) => {
                                        usercol.set({
                                          "word":snapshot.data.docs[index]['word'],
                                          "director":snapshot.data.docs[index]['director'],
                                          "count": 1}),
                                        usercol.update({'count': value['count'] + 1})
                                      });

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                reviewList.reviewListInfo(
                                                  snapshot.data.docs[index]
                                                      ['word'],
                                                  snapshot.data.docs[index]
                                                      ['director'],
                                                )),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                // builder: (context) => writeReview(movie_title, movie_director)),
                builder: (context) => MLPage()),
          );
        },
        label: const Text(
          '사진으로 검색',
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'NanumBarun'),
        ),
        icon: const Icon(
          Icons.photo,
          color: Colors.white,
        ),
        backgroundColor: Colors.pink[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
