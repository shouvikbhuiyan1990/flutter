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

  Widget getFilters(
    String title,
    String subtitle,
    Function sateSet,
    bool currentValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: sateSet,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            getFilters(
              'Vegeterian',
              'Select Only Vegeterian food',
              (newValue) => {
                setState(() {
                  _filters['_isVegetarian'] = newValue;
                }),
              },
              _filters['_isVegetarian'],
            ),
            getFilters(
              'Vegan',
              'Select Only Vegan food',
              (newValue) => {
                setState(() {
                  _filters['_isVegan'] = newValue;
                }),
              },
              _filters['_isVegan'],
            ),
            getFilters(
              'Gluten Free',
              'Select Only Gluten Free food',
              (newValue) => {
                setState(() {
                  _filters['_isGlutenFree'] = newValue;
                }),
              },
              _filters['_isGlutenFree'],
            ),
            getFilters(
              'Lactose Free',
              'Select Only Lactose Free food',
              (newValue) => {
                setState(() {
                  _filters['_isLactoseFree'] = newValue;
                }),
              },
              _filters['_isLactoseFree'],
            )
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
