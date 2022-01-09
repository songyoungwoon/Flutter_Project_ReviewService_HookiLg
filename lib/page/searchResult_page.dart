import 'dart:convert';

import 'package:flutter/material.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

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
  String removeBToslashB(String str){
    print(str);
    str.replaceAll('<b>', '');
    str.replaceAll('</b>', '');
    print(str);

    return str;
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
          title: Text(searchText + " " + "검색결과"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Center(
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ),
          ],
          backgroundColor: Colors.black12,
        ),
        body: FutureBuilder(
            future: fetch(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if(!snap.hasData) return Center(child: CircularProgressIndicator());
              List result = snap.data['items'];
              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      leading: get_urlIsNull(result[index]['image'])
                              ? Text('no image')//Image.asset('images/loading.jpg')
                              : FadeInImage.assetNetwork(
                                  placeholder: 'images/loading.jpg',
                                  image: result[index]['image'].toString()),
                      title: Text(result[index]['title'].toString()),
                      subtitle: Text(removeBToslashB(result[index]['subtitle']) + "dk"),
                      trailing: Icon(Icons.favorite),
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
