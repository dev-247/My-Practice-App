import 'package:deli_meals/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          Container(
            color: Colors.amberAccent,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Text(
              'Drawer',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_rounded),
            title: const Text('Meals'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Filters'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
