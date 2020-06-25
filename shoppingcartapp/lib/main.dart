import 'package:flutter/material.dart';

import './screens/filter_screen.dart';
import './screens/categories_screen.dart';
import './screens/mealdetails_screen.dart';
import './screens/categorydetails_screen.dart';
import './screens/botton_navigation_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        CategoryDetails.routeName: (context) => CategoryDetails(),
        MealDetails.routeName: (context) => MealDetails(),
        CategoryMain.routeName: (context) => CategoryMain(),
        Filters.routeName: (context) => Filters(),
      },
    );
  }
}
