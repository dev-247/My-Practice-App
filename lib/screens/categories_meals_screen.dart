import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  final List<Meal> availableMeal;
  // final String id;
  // final String categoryTitle;

  const CategoriesMealScreen(this.availableMeal);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? categoryTitle = routeArgs['title'];
    final String? categaryId = routeArgs['id'];
    final categoryMeals = availableMeal.where((meal) {
      return meal.categories.contains(categaryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          ); //;recipy item widget
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
