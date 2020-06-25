import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {


  void _navigateToDrawerMenu(BuildContext ctx, String menu) {
    switch(menu) {
      case 'category':
        Navigator.of(ctx).pushReplacementNamed('/');
        break;
      case 'filters':
        Navigator.of(ctx).pushReplacementNamed(Filters.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[50],
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            padding: EdgeInsets.only(top: 60, bottom: 60, left: 20, right: 20),
            child: Center(
              child: Text(
                'Filter Menu',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text('Category'),
                  leading: Icon(Icons.category),
                  onTap: () => _navigateToDrawerMenu(context, 'category'),
                ),
                ListTile(
                  title: Text('Filters'),
                  leading: Icon(Icons.filter_list),
                  onTap: () => _navigateToDrawerMenu(context, 'filters'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
