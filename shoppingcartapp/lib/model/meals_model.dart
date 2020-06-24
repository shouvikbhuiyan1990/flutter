import 'package:flutter/material.dart';

enum Affordability {
  Luxurious,
  Affordable,
  Pricey
}

enum Complexity {
  Simple,
  Challenging,
  Hard
}

class Meal {
  @required final String id;
  @required final List<String> categories;
  @required final List<String> ingredients;
  @required final List<String> steps;
  @required final String title;
  @required final String imageUrl;
  @required final int duration;
  @required final bool isGlutenFree;
  @required final bool isVegan;
  @required final bool isVegetarian;
  @required final bool isLactoseFree;
  @required final Affordability affordability;
  @required final Complexity complexity;

  const Meal({
    this.id,
    this.title,
    this.categories,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
    this.duration,
    this.imageUrl,
    this.affordability,
    this.complexity
  });
}
