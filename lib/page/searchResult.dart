import 'package:flutter/material.dart';
import '../main.dart';

class searchResult extends StatefulWidget {
  const searchResult({Key? key}) : super(key: key);

  @override
  _searchResultState createState() => _searchResultState();
}

class _searchResultState extends State<searchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(Icons.file_upload),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.delete),
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
        ],
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('search result'),
          ],
        ),
      ),
    );
  }
}
