import 'package:cod3r_navigation/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import 'categories_meals_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Categories List', 'screen': CategoriesScreen()},
    {'title': 'Favorites List', 'screen': FavoriteScreen()},
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Theme.of(context).accentColor,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text('Category')),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
