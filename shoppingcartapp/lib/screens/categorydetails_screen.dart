import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Center(
        child: Text('Navigated to new Details page'),
      ),
    );
  }
}
