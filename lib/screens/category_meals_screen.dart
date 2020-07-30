import 'package:flutter/material.dart';
import 'package:scrumptious/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(routeArgs['id']))
        .toList();
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
                imageUrl: categoryMeals[i].imageUrl,
                title: categoryMeals[i].title,
                duration: categoryMeals[i].duration,
                complexity: categoryMeals[i].complexity,
                affordability: categoryMeals[i].affordability);
          },
          itemCount: categoryMeals.length),
      appBar: AppBar(title: Text(routeArgs['title'])),
    );
  }
}
