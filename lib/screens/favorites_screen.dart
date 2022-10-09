import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favMeals;
  const FavoritesScreen(this.favMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
        child: Text('Add some Favorite'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeals[index].id,
            title: favMeals[index].title,
            imageUrl: favMeals[index].imageUrl,
            duration: favMeals[index].duration,
            complexity: favMeals[index].complexity,
            affordability: favMeals[index].affordability,
          ); //;recipy item widget
        },
        itemCount: favMeals.length,
      );
    }
  }
}
