import 'package:flutter/material.dart';

import '../model/meals_model.dart';
import '../data/category_dummy_data.dart';

class MealDetails extends StatelessWidget {
  static String routeName = '/meal-details';

  Widget _titleHeading(String heading) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        heading,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final Meal mealDetails = DUMMY_MEALS.singleWhere(
      (element) => element.id == args['id'],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(
                mealDetails.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              _titleHeading('Steps'),
              ...mealDetails.steps.map((e) {
                int index = mealDetails.steps.indexOf(e);
                return ListTile(
                  title: Text(
                    e,
                    style: TextStyle(fontSize: 14),
                  ),
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                    backgroundColor: Colors.pink,
                  ),
                );
              }).toList(),
              _titleHeading('Ingrediants'),
              ...mealDetails.ingredients.map((e) {
                return ListTile(
                  dense: true,
                  title: Text(
                    e,
                    style: TextStyle(fontSize: 14),
                  ),
                  leading: Icon(
                    Icons.done_outline,
                    size: 14,
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(args['id']);
        },
      ),
    );
  }
}
