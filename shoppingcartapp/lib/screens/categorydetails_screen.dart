import 'package:flutter/material.dart';

import '../model/meals_model.dart';
import '../widgets/categorydetails_item.dart';
import '../data/category_dummy_data.dart';

class CategoryDetails extends StatefulWidget {
  static String routeName = '/category-details';

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Meal> selectedMeals;

  void _updateCategoryList(mealId) {
    selectedMeals.removeWhere(
      (element) => element.id == mealId,
    );
    setState(() {
      selectedMeals = selectedMeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryId = args['id'];
    selectedMeals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(categoryId),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int index) => CategoryDetailsItem(
            title: selectedMeals[index].title,
            imageUrl: selectedMeals[index].imageUrl,
            duration: selectedMeals[index].duration,
            affordability: selectedMeals[index].affordability,
            complexity: selectedMeals[index].complexity,
            id: selectedMeals[index].id,
            updateMealList: _updateCategoryList,
          ),
          itemCount: selectedMeals.length,
        ),
      ),
    );
  }
}