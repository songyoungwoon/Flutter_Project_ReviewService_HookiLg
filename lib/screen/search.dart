import 'package:flutter/material.dart';
import '../widget/search_bar.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Padding(padding: EdgeInsets.all(12)),
          Container(
            child: searchBar(),
          ),
        ]),
      ),
    );
  }
}
