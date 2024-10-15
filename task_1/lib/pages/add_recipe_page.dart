import 'package:flutter/material.dart';
import '../models/recipe.dart';

class AddRecipePage extends StatefulWidget {
  final Function(Recipe) onAddRecipe;

  AddRecipePage({required this.onAddRecipe});

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _imageUrl = '';
  List<String> _ingredients = [];
  List<String> _steps = [];

  final _ingredientController = TextEditingController();
  final _stepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipe Name'),
                onSaved: (value) {
                  _name = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a recipe name';
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                onSaved: (value) {
                  _imageUrl = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter an image URL';
                  return null;
                },
              ),
              TextFormField(
                controller: _ingredientController,
                decoration: InputDecoration(labelText: 'Add Ingredient'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _ingredients.add(_ingredientController.text);
                    _ingredientController.clear();
                  });
                },
                child: Text('Add Ingredient'),
              ),
              ..._ingredients.map((ingredient) => ListTile(
                title: Text(ingredient),
              )),
              TextFormField(
                controller: _stepController,
                decoration: InputDecoration(labelText: 'Add Step'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _steps.add(_stepController.text);
                    _stepController.clear();
                  });
                },
                child: Text('Add Step'),
              ),
              ..._steps.map((step) => ListTile(
                title: Text(step),
              )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onAddRecipe(
                      Recipe(
                        name: _name,
                        imageUrl: _imageUrl,
                        ingredients: _ingredients,
                        steps: _steps,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

