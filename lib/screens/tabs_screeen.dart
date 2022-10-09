import 'package:deli_meals/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
      initialIndex: 0,
      //First tab (default tab)
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.titleMedium,
            labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            indicatorColor: Colors.lightGreen,
            labelColor: Colors.lightGreen,
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(
                text: 'Category',
              ),
              Tab(text: 'Favorites')
            ],
          ),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          //  FavoritesScreen(),
        ]),
      ),
    ));
  }
}
