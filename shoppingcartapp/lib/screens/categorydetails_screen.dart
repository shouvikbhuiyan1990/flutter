import 'package:flutter/material.dart';

import '../model/meals_model.dart';
import '../widgets/categorydetails_item.dart';
import '../data/category_dummy_data.dart';

class CategoryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryId = args['id'];
    final List<Meal> selectedMeals = DUMMY_MEALS.where(
      (element) => element.categories.contains(categoryId),
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int index) => CategoryDetailsItem(
            title: selectedMeals[index].title,
          ),
          itemCount: selectedMeals.length,
        ),
      ),
    );
  }
}
