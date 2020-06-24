import 'package:flutter/material.dart';
import 'package:shoppingcartapp/data/category_dummy_data.dart';

import '../widgets/category_item.dart';

class CategoryMain extends StatelessWidget {
  const CategoryMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
        child: GridView(
          children: <Widget>[
            ...DUMMY_CATEGORIES.map(
              (e) => CategoryItems(
                title: e.title,
                tileColor: e.color,
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
