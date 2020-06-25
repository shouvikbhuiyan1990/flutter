import 'package:flutter/material.dart';

import '../model/meals_model.dart';
import '../widgets/categorydetails_item.dart';

class CategoryDetails extends StatefulWidget {
  static String routeName = '/category-details';
  final List<Meal> filteredMeals;
  CategoryDetails(this.filteredMeals);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Meal> selectedMeals;
  var _isLoaded = false;
  var args = [];
  String categoryTitle = '';

  @override
  void didChangeDependencies() {
    if (!_isLoaded) {
      var args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final String categoryId = args['id'];
      categoryTitle = args['title'];

      selectedMeals = widget.filteredMeals
          .where(
            (element) => element.categories.contains(categoryId),
          )
          .toList();

      _isLoaded = true;
    }
    super.didChangeDependencies();
  }

  void _updateCategoryList(mealId) {
    setState(() {
      selectedMeals.removeWhere(
        (element) => element.id == mealId,
      );
    });
  }

  Widget get _categoryList {
    if (selectedMeals.length > 0)
      return ListView.builder(
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
      );
    return Center(
      child: Text(
        'Nothing Here to see, go back to Category Page to see more',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: _categoryList,
      ),
    );
  }
}
