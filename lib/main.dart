import 'package:flutter/material.dart';

import 'dummy.dart';
import './models/meal.dart';

import './screens/filters_screen.dart';
import './screens/Bottom_navigation.dart';
import './screens/meal_details_screen.dart';
import './screens/categories_meals_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//========================================================//
//                 SETTING FILTER    and Favorites        //
//========================================================//
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeal = dummyMeals;
  final List<Meal> _favMeals = [];

  void _toggleFav(String mealId) {
    final existingIndex = _favMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeal = dummyMeals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFav(String id) {
    return _favMeals.any((meal) => meal.id == id); //
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli_Meals',
      theme: ThemeData(
          canvasColor: const Color.fromARGB(255, 239, 252, 228),
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amberAccent)),
      // home: CategoriesScreen(),
      initialRoute: '/', //!Default is '/' (home screen)
      routes: {
        '/': (ctx) => BottomTabScreen(_favMeals),
        CategoriesMealScreen.routeName: (ctx) =>
            CategoriesMealScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFav, _isMealFav),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilter, _filters),
      },
    );
  }
}
