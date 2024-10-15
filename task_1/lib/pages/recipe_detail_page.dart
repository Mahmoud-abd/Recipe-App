import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(recipe.imageUrl),
              SizedBox(height: 16),
              Text(
                'Ingredients',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ...recipe.ingredients.map((ingredient) => Text('- $ingredient')).toList(),
              SizedBox(height: 16),
              Text(
                'Steps',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ...recipe.steps.map((step) => Text('- $step')).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
