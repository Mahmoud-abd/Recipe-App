import 'package:flutter/material.dart';
import 'add_recipe_page.dart';
import 'recipe_detail_page.dart';
import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [
    Recipe(
      name: 'Pasta',
      imageUrl: 'assets/img.png',
      ingredients: ['Pasta', 'Tomato Sauce', 'Cheese'],
      steps: ['Boil pasta', 'Add sauce', 'Mix and serve'],
    ),
    Recipe(
      name: 'Pizza',
      imageUrl: 'assets/img_1.png',
      ingredients: ['Dough', 'Tomato Sauce', 'Cheese'],
      steps: ['Prepare dough', 'Add toppings', 'Bake in oven'],
    ),
    Recipe(
      name: 'Chicken Feet',
      imageUrl: 'assets/photo.webp',
      ingredients: ['chicken feet', 'red chilli', 'tbsp soy','tbsp vinegar','little black pepper','slices Some ginger'],
      steps: ['Wash well chicken feet', 'Blanch it then peel some yellow skin from the feet', 'Put in a pot and add in all ingredients'],
    ),
  Recipe(
  name: 'Pancake',
    imageUrl:'assets/21014-Good-old-Fashioned-Pancakes-mfs_001-1fa26bcdedc345f182537d95b6cf92d8.jpg',
  ingredients: ['Flour', 'Milk', 'Eggs', 'Sugar', 'Butter'],
  steps: [
  'Mix the flour, sugar, and eggs.',
  'Add milk and mix well.',
  'Heat butter on a pan.',
  'Pour the mixture and cook on both sides.',
  'Serve with syrup.'
  ],
  ),

   Recipe(
  name: 'Spaghetti Bolognese',
     imageUrl:'assets/spaghetti-bolognese-106560-1.jpg',
  ingredients: ['Spaghetti', 'Ground Beef', 'Tomato Sauce', 'Onion', 'Garlic', 'Olive Oil'],
  steps: [
  'Cook the spaghetti according to package instructions.',
  'In a pan, sauté onions and garlic in olive oil.',
  'Add ground beef and cook until browned.',
  'Pour in tomato sauce and simmer for 10 minutes.',
  'Serve the sauce over the spaghetti.'
  ],
  ),

  Recipe(
  name: 'Caesar Salad',
    imageUrl:'assets/istockphoto-184938052-612x612.jpg',
  ingredients: ['Romaine Lettuce', 'Croutons', 'Parmesan Cheese', 'Caesar Dressing'],
  steps: [
  'Chop the romaine lettuce.',
  'Mix lettuce with croutons and grated parmesan.',
  'Drizzle with Caesar dressing and toss well.',
  'Serve immediately.'
  ],
  ),
  Recipe(
  name: 'Guacamole',
  imageUrl:'assets/istockphoto-469866573-612x612.jpg',
  ingredients: ['Avocados', 'Lime', 'Onion', 'Cilantro', 'Salt', 'Tomato'],
  steps: [
  'Mash the avocados in a bowl.',
  'Add chopped onions, cilantro, and tomatoes.',
  'Squeeze lime juice and mix well.',
  'Season with salt.',
  'Serve with tortilla chips or as a side dish.'
  ],
  ),

   Recipe(
  name: 'Chocolate Brownies',
  imageUrl:'assets/Brownies_0.jpg',
  ingredients: ['Butter', 'Sugar', 'Eggs', 'Cocoa Powder', 'Flour', 'Vanilla Extract'],
  steps: [
  'Melt the butter and mix with sugar and vanilla extract.',
  'Add eggs one by one and whisk.',
  'Mix in cocoa powder and flour until smooth.',
  'Pour into a baking dish and bake at 180°C for 25-30 minutes.',
  'Let it cool before cutting into squares.',
  'Serve and enjoy!'
  ],
  ),
  Recipe(
  name: 'Sushi Rolls',
  imageUrl:'assets/a67d95e8044769cf96d551c0ad09f7f9.jpg',
  ingredients: ['Sushi Rice', 'Nori (seaweed)', 'Cucumber', 'Avocado', 'Salmon', 'Soy Sauce'],
  steps: [
  'Cook the sushi rice and let it cool.',
  'Place a sheet of nori on a bamboo mat.',
  'Spread the rice evenly over the nori.',
  'Add cucumber, avocado, and salmon on top.',
  'Roll it tightly and slice into pieces.',
  'Serve with soy sauce.'
  ],
  ),

  Recipe(
  name: 'Chicken Tacos',
  imageUrl:'assets/Shredded-Chicken-Tacos-Recipe-1.jpg',
  ingredients: ['Chicken Breast', 'Taco Shells', 'Lettuce', 'Tomatoes', 'Cheese', 'Salsa'],
  steps: [
  'Cook the chicken breast and shred it.',
  'Warm up the taco shells.',
  'Fill each taco with chicken, lettuce, tomatoes, and cheese.',
  'Top with salsa and serve.'
  ],
  ),

Recipe(
  name: 'Chocolate Chip Cookies',
  imageUrl:'assets/BAKERY-STYLE-CHOCOLATE-CHIP-COOKIES-9-637x637-1.jpg',
  ingredients: ['Butter', 'Sugar', 'Brown Sugar', 'Eggs', 'Flour', 'Chocolate Chips', 'Baking Soda'],
  steps: [
  'Preheat oven to 180°C.',
  'Cream the butter and sugars together.',
  'Add eggs and mix well.',
  'Stir in flour, baking soda, and chocolate chips.',
  'Drop spoonfuls of dough onto a baking sheet.',
  'Bake for 10-12 minutes or until golden brown.',
  'Let them cool before serving.'
  ],
  ),

  Recipe(
  name: 'Fried Rice',
  imageUrl:'assets/82f8a09e19a456b94077b31d23861a5b03905307-1000x667.webp',
  ingredients: ['Cooked Rice', 'Eggs', 'Carrots', 'Peas', 'Soy Sauce', 'Green Onions'],
  steps: [
  'Scramble the eggs in a pan and set aside.',
  'Sauté carrots and peas in a pan.',
  'Add the cooked rice and mix well.',
  'Stir in soy sauce and scrambled eggs.',
  'Top with chopped green onions and serve.'
  ],
  )


  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes
        .where((recipe) =>
            recipe.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: RecipeSearchDelegate(recipes: recipes));
            },
          )
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: filteredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = filteredRecipes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(recipe: recipe),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        recipe.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recipe.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddRecipePage(onAddRecipe: (recipe) {
                      setState(() {
                        recipes.add(recipe);
                      });
                    })),
          );
        },
      ),
    );
  }
}

class RecipeSearchDelegate extends SearchDelegate {
  final List<Recipe> recipes;

  RecipeSearchDelegate({required this.recipes});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = recipes
        .where(
            (recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final recipe = results[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailPage(recipe: recipe),
              ),
            );
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      recipe.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    recipe.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = recipes
        .where(
            (recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final recipe = suggestions[index];
        return ListTile(
          title: Text(recipe.name),
          onTap: () {
            query = recipe.name;
            showResults(context);
          },
        );
      },
    );
  }
}
