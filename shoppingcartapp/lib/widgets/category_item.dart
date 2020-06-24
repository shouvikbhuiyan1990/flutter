import 'package:flutter/material.dart';

import '../screens/categorydetails_screen.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final Color tileColor;
  final String id;

  CategoryItems({this.title, this.tileColor, this.id});

  void _navigateToDetailsPage(context, title) {
    Navigator.pushNamed(
      context,
      CategoryDetails.routeName,
      arguments: <String, String>{
        'title': title,
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDetailsPage(context, title),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.centerLeft,
            colors: [tileColor],
            stops: [0.8],
          ),
        ),
        child: Center(
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
