import 'package:flutter/material.dart';
import 'package:scrumptious/models/meal.dart';
import 'package:scrumptious/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, String> routeArgs;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    displayedMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(routeArgs['id']))
        .toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
                id: displayedMeals[i].id,
                imageUrl: displayedMeals[i].imageUrl,
                title: displayedMeals[i].title,
                duration: displayedMeals[i].duration,
                complexity: displayedMeals[i].complexity,
                affordability: displayedMeals[i].affordability,
                removeItem: _removeMeal);
          },
          itemCount: displayedMeals.length),
      appBar: AppBar(title: Text(routeArgs['title'])),
    );
  }
}
