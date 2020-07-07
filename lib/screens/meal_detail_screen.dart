import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetatilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtaining the Meal object from arguments passed by route
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Detatil'),
      ),
      body: Center(
        child: Text('Details of ${meal.title}'),
      ),
    );
  }
}
