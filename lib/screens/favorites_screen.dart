import 'package:flutter/material.dart';
import 'package:scrumptious/models/meal.dart';
import 'package:scrumptious/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;
  FavoritesScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Text("You have no favorites yet-start adding some!"),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
              id: favorites[i].id,
              imageUrl: favorites[i].imageUrl,
              title: favorites[i].title,
              duration: favorites[i].duration,
              complexity: favorites[i].complexity,
              affordability: favorites[i].affordability,
            );
          },
          itemCount: favorites.length);
    }
  }
}
