import 'package:flutter/material.dart';

import '../screens/mealdetails_screen.dart';
import '../model/meals_model.dart';

class CategoryDetailsItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  CategoryDetailsItem({
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
  });

  String get _getComplexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Complex';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      default:
        return '';
        break;
    }
  }

  String get _getAffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Cheap';
        break;
      case Affordability.Luxurious:
        return 'Luxury';
        break;
      case Affordability.Pricey:
        return 'Costly';
        break;
      default:
        return '';
        break;
    }
  }

  void _navigateToDetailsPage(context) {
    Navigator.pushNamed(
      context,
      MealDetails.routeName,
      arguments: <String, String>{},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDetailsPage(context),
      child: Container(
          margin: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 5,
            right: 5,
          ),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            color: Theme.of(context).canvasColor,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 10,
                      width: 200,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                        ),
                        child: Text(
                          title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          child: Row(
                        children: <Widget>[
                          Icon(Icons.update),
                          Text(
                            '$duration Minutes',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Icon(Icons.whatshot),
                          Text(
                            _getComplexityText,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Icon(Icons.content_paste),
                          Text(
                            _getAffordabilityText,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
