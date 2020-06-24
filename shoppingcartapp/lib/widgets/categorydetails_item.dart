import 'package:flutter/material.dart';

class CategoryDetailsItem extends StatelessWidget {
  final String title;

  CategoryDetailsItem({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Text(title)
          ],)
        ],
      ),
    ));
  }
}
