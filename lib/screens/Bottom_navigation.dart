import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class BottomTabScreen extends StatefulWidget {
  final List<Meal> favMeals;
  const BottomTabScreen(this.favMeals, {Key? key}) : super(key: key);

  @override
  State<BottomTabScreen> createState() => _BottomTabScreen();
}

class _BottomTabScreen extends State<BottomTabScreen> {
  late final List<Map<String, dynamic>> _pages;

  int _selectedTabIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Category'},
      {'page': FavoritesScreen(widget.favMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Meals/${_pages[_selectedTabIndex]['title']}'),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedTabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        elevation: 5,
        currentIndex: _selectedTabIndex,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded), label: 'Favorites'),
        ],
      ),
    );
  }
}
