import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static String routeName = '/filters';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final Map<String, bool> _filters = {
    '_isGlutenFree': false,
    '_isVegan': false,
    '_isVegetarian': false,
    '_isLactoseFree': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text('Vegeterian'),
              subtitle: Text('Select Only Vegeterian food'),
              value: _filters['_isVegetarian'],
              onChanged: (newValue) {
                setState(() {
                  _filters['_isVegetarian'] = newValue;
                });
              },
            )
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
