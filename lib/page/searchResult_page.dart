//library
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';

//local path
// import '../main.dart';
import 'reviewList_page.dart';
import '../screen/fristhome.dart';

class searchResult extends StatefulWidget {
  String searchText;

  // boolean
  searchResult(this.searchText);

  @override
  _searchResultState createState() => _searchResultState(searchText);
}

class _searchResultState extends State<searchResult> {
  String searchText;

  _searchResultState(this.searchText);

  String getJsonSearchText(String searchText) {
    String jsonText = jsonEncode(searchText);
    return jsonText;
  }

  bool get_urlIsNull(String url) {
    if (url == '') {
      return true;
    } else
      return false;
  }

  Future fetch() async {
    String jsonText = getJsonSearchText(searchText);
    var res = await http.get(
        Uri.parse(
          "https://openapi.naver.com/v1/search/movie.json?query=$jsonText",
        ),
        headers: {
          "X-Naver-Client-Id": "EAgJWlJ06zRLksT2nQKf",
          "X-Naver-Client-Secret": "svAVfEmK82"
        });
    return json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(searchText + ' 검색 결과',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'EliceDigitalBaeum',
                  fontSize: 15)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black26),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Center(
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.indigo[200]),
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => FirstHome());
                  Navigator.pushReplacement(context, route);
                },
              ),
            ),
          ],
        ),
        body: FutureBuilder(
            future: fetch(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (!snap.hasData)
                return Center(child: CircularProgressIndicator());
              List result = snap.data['items'];
              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, int index) {
                    return SingleChildScrollView(
                      child: Card(
                        elevation: 1,
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                        child: GestureDetector(
                          onTap: () {
                            final usercol = FirebaseFirestore.instance
                                .collection("search_word")
                                .doc(result[index]['title']);
                            var data = usercol.get().then((value) => {
                                  usercol.set({
                                    "word":result[index]['title'],
                                    "director":result[index]['director'],
                                    "count": 1}),
                                  usercol.update({'count': value['count'] + 1})
                                });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => reviewList.reviewListInfo(result[index]['title'], result[index]['director'],)),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                    child: get_urlIsNull(result[index]['image'])
                                        ? Image.asset(
                                            'images/noImage.png',
                                            fit: BoxFit.cover,
                                            scale: 20,
                                          )
                                        : FadeInImage.assetNetwork(
                                            placeholder: 'images/loading.jpg',
                                            image: result[index]['image']
                                                .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                Container(
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Html(
                                          data: '<b>' +
                                              result[index]['title']
                                                  .toString() +
                                              '</b>'),
                                      Html(
                                        data: result[index]['subtitle'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /*
                      ListTile(
                        leading:Container(
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: get_urlIsNull(result[index]['image'])
                              ? Image.asset(
                                  'images/noImage.png',
                                  fit: BoxFit.cover,
                                  /*
                                  width: 55,
                                  height: 100,*/
                                ) //Image.asset('images/loading.jpg')
                              : FadeInImage.assetNetwork(
                                  placeholder: 'images/loading.jpg',
                                  image: result[index]['image'].toString(),
                                  fit: BoxFit.cover,
                                  /*
                                  width: 55,
                                  height: 100,*/
                                ),
                        ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                        title: Container(
                            child: Html(
                              data: '<b>'+result[index]['title'].toString()+'</b>')
                        ),

                        subtitle: Html(  data: result[index]['subtitle'],),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => reviewList.reviewListInfo(result[index]['title'],result[index]['director'],)),
                          );
                        },
                      ),
                          */
                      ),
                    );
                  });
            })

        /*
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('"' + searchText + '"' + " " + '검색결과' + " "),
            FutureBuilder(
                future: fetch(),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  List result = snap.data['items'];
                  return ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          leading: Text("${index+1}"),
                              //Image.asset(result[index]['image']),
                          title: Text(result[index]['title'].toString()),
                          subtitle: Text(result[index]['subtitle'].toString()),
                          trailing: Icon(Icons.favorite),
                        );
                      });
                })
          ],
        ),
      ),
      */
        );
  }
}
