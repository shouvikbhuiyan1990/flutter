import 'package:flutter/material.dart';

import '../data/category_dummy_data.dart';
import '../widgets/category_item.dart';

class CategoryMain extends StatelessWidget {
  static String routeName = '/categoryName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
        child: GridView(
          children: <Widget>[
            ...DUMMY_CATEGORIES.map(
              (e) => CategoryItems(
                title: e.title,
                tileColor: e.color,
                id: e.id,
              ),
            ).toList()
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
