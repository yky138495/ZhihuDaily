import 'package:flutter/material.dart';
import './mg_home_list.dart';
import './more.dart';
import './mg_book_txt.dart';

class MgBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<MgBottomNavigationBar> {
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    pages
      ..add(MgHomeList())
      ..add(MGBookTxt())
      ..add(MGMoreListView()
      );
  }

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTapHandler,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              title: Text('知乎日报'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.markunread,
              ),
              title: Text('每日一读'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('更多'),
            ),
          ],
        ));
  }
}
