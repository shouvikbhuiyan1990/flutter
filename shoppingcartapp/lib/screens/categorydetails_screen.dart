import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']),
      ),
      body: Center(
        child: Text(args['title']),
      ),
    );
  }
}
