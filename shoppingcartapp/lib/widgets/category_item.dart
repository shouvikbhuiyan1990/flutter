import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final Color tileColor;

  CategoryItems({this.title, this.tileColor});

  void _navigateToDetailsPage(context, title) {
    Navigator.pushNamed(
      context,
      '/category-details',
      arguments: <String, String>{
        'title': title,
        'description': title,
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
