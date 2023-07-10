import 'package:flutter/material.dart';
import '../model/recipe_model.dart';

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeListScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.fastfood),
            title: Text(recipes[index].title, style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(recipes[index].description),
          );
        },
      ),
    );
  }
}