import 'package:flutter/material.dart';
import './main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function setFilter;
  Map<String, bool> currentFilter;

  FilterScreen(this.setFilter, this.currentFilter);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;
  bool _isGlutanFree = false;

  @override
  void initState() {
    _isGlutanFree = widget.currentFilter['gluten'] as bool;
    _isLactoseFree = widget.currentFilter['lactose'] as bool;
    _isVegan = widget.currentFilter['vegan'] as bool;
    _isVegetarian = widget.currentFilter['vegetarian'] as bool;

    super.initState();
  }

  SwitchListTile _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    var updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //==================================================//
          //                 Saving Filter Data               //
          //==================================================//

          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _isGlutanFree,
                'lactose': _isLactoseFree,
                'vegetarian': _isVegetarian,
                'vegan': _isVegan,
              };
              widget.setFilter(selectedFilters);
            },
            icon: const Icon(Icons.save_rounded),
          ),
        ],
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Please filter your meals!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten Free',
                    'Only includes Gluten free meals',
                    _isGlutanFree, (newValue) {
                  setState(() {
                    _isGlutanFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose Free',
                    'Only includes Lactose free meals',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only includes Vegetarian  meals',
                    _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only includes Vegan meals', _isVegan, (newValue) {
                  setState(
                    () {
                      _isVegan = newValue;
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
