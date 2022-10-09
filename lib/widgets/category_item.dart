import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategary(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategary(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(255, 128, 127, 127),
                offset: Offset(4, 5)),
          ],
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.65),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
