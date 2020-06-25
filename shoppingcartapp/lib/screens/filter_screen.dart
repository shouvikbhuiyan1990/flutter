import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Filters extends StatelessWidget {
  static String routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('Filters'),
      ),
      drawer: MainDrawer(),
    );
  }
}
