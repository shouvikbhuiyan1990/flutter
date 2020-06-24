import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourites_screen.dart';

class BottomTabNavigation extends StatefulWidget {
  BottomTabNavigation({Key key}) : super(key: key);

  @override
  _BottomTabNavigationState createState() => _BottomTabNavigationState();
}

class _BottomTabNavigationState extends State<BottomTabNavigation> {
  int _navigationIndex = 0;

  void _updateNavigation(int index) {
    setState(() {
      _navigationIndex = index;
    });
  }

  final List<Map<String, Object>> homeWidgets = [
    {
      'title': 'Category',
      'widget': CategoryMain(),
    },
    {
      'title': 'Favourites',
      'widget': Favourites(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homeWidgets[_navigationIndex]['title']),
      ),
      body: homeWidgets[_navigationIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Category')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favourites')),
        ],
        currentIndex: _navigationIndex,
        onTap: _updateNavigation,
      ),
    );
  }
}
