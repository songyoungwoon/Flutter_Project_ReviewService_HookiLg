import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../page/searchResult_page.dart';

class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 7),
      height: 72,
      width: 500,
      child: Row(
        children: [
          Expanded(
            flex: 6,
              child:TextField(
              onSubmitted: (value){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchResult(value)),
                );
              },
              focusNode: focusNode,
              style: TextStyle(
                fontSize: 12,
              ),
              autofocus: false,
              controller: _filter,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueAccent[99],
                prefixIcon: focusNode.hasFocus
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            _filter.clear();
                            _searchText = "";
                            focusNode.unfocus();
                          });
                        },
                        child: Text('취소'))
                    : Icon(Icons.search, color: Colors.black45, size: 20),
                suffixIcon: focusNode.hasFocus
                    ? IconButton(
                        icon:
                            Icon(Icons.cancel, color: Colors.black26, size: 20),
                        onPressed: () {
                          setState(() {
                            _filter.clear();
                            _searchText = "";
                          });
                        },
                      )
                    : Text(''),
                hintText: '리뷰나 해석을 보고싶은 영화를 검색하세요.',
                labelStyle: TextStyle(color: Colors.black12),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ),
        ],
      ),
    );



    // ------------------------------------------------
    /* open sorce search_bar  don't use
    return Scaffold(
      // This is handled by the search bar itself.
      // resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildFloatingSearchBar(),
        ],
      ),
    );
    */
  }

  // --------------------------------------------------
  /* open sorce search_bar  don't use
  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: '리뷰나 결말해석이 궁금한 영화를 검색하세요.',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),

      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => searchResult()),
              );
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],

      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
  */
}
