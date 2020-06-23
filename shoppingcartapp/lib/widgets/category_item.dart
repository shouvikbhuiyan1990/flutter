import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {

  final String title;
  final Color tileColor;

  CategoryItems({this.title, this.tileColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          tileMode: TileMode.mirror,
          begin: Alignment.centerLeft,
          colors: [tileColor],
          stops: [0.8],
        ),
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
