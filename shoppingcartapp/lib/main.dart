import 'package:flutter/material.dart';

import './model/meals_model.dart';
import './data/category_dummy_data.dart';
import './screens/filter_screen.dart';
import './screens/categories_screen.dart';
import './screens/mealdetails_screen.dart';
import './screens/categorydetails_screen.dart';
import './screens/botton_navigation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    '_isGlutenFree': false,
    '_isVegan': false,
    '_isVegetarian': false,
    '_isLactoseFree': false,
  };

  List<Meal> filteredMeals = DUMMY_MEALS;

  void _setFilterPreference(newPreference) {
    setState(() {
      _filters = newPreference;
      filteredMeals = DUMMY_MEALS.where((element) {
        if (!element.isGlutenFree && newPreference['_isGlutenFree']) {
          return false;
        }
        if (!element.isVegan && newPreference['_isVegan']) {
          return false;
        }
        if (!element.isVegetarian && newPreference['_isVegetarian']) {
          return false;
        }
        if (!element.isLactoseFree && newPreference['_isLactoseFree']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Color.fromRGBO(253, 252, 252, 0.8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BottomTabNavigation(),
        CategoryDetails.routeName: (context) => CategoryDetails(filteredMeals),
        MealDetails.routeName: (context) => MealDetails(),
        CategoryMain.routeName: (context) => CategoryMain(),
        Filters.routeName: (context) => Filters(_setFilterPreference, _filters),
      },
    );
  }
}
