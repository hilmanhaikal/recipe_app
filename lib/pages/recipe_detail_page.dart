import 'package:flutter/material.dart';
import '/models/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  recipe.image,
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                recipe.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Ingredients',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              for (String ingredient in recipe.ingredients)
                Text('• $ingredient', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20.0),
              const Text(
                'Steps',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              for (int i = 0; i < recipe.steps.length; i++)
                Text('${i + 1}. ${recipe.steps[i]}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF720606),
        onPressed: () {
          Navigator.pushNamed(context, '/edit_recipe', arguments: recipe);
        },
        child: const Icon(Icons.edit, color: Colors.white,),
      ),
    );
  }
}
