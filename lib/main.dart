import 'package:flutter/material.dart';

import './screens/categories_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/settings_screen.dart';
import './utils/routes.dart';
import './models/meal.dart';
import './data/dummy_data.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaliableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      _avaliableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) =>
            CategoriesMealsScreen(_avaliableMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetatilScreen(),
        AppRoutes.SETTINGS: (_) => SettingsScreen(_filterMeals),
      },
    );
  }
}
