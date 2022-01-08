import 'package:flutter/material.dart';
import '../main.dart';
import '../widget/bottom_bar.dart';

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
          Center(
          child:IconButton(
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
          ],
        ),
      ),
    );
  }
}
