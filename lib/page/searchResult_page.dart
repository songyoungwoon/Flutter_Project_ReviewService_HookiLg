import 'dart:convert';

import 'package:flutter/material.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class searchResult extends StatefulWidget {
  String searchText;

  searchResult(this.searchText);

  @override
  _searchResultState createState() => _searchResultState(searchText);
}

class _searchResultState extends State<searchResult> {
  String searchText;

  _searchResultState(this.searchText);


  String getJsonSearchText(String searchText) {
    print(searchText);
    String json = jsonEncode(searchText);
    print(json);
    return json;
  }

  Future fetch() async {
    String json = getJsonSearchText(searchText);
    print("https://openapi.naver.com/v1/search/movie.json?query=$json");
    var res = await http
        .get(
        "https://openapi.naver.com/v1/search/movie.json?query=$json", headers: {
      "X-Naver-Client-Id": "EAgJWlJ06zRLksT2nQKf",
      "X-Naver-Client-Secret": "svAVfEmK82"
    });
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('search result'),
            Text(searchText),
          ],
        ),
      ),
    );
  }
}
