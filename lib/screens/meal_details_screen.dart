import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../dummy.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/Meal-Detail';
  final Function toggleFav;
  final Function isMealFav;

  const MealDetailScreen(this.toggleFav, this.isMealFav);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(15)),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/images/pasta.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            // child: Image.network (  //!Setup default image in case Network Image error.
            //   selectedMeal.imageUrl,

            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: const Color.fromARGB(255, 178, 247, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFav(mealId),
        child: isMealFav(mealId)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }
}
