import 'dart:convert';
import 'package:flutter/services.dart';
import '/models/recipe.dart';
import '/models/recipe_type.dart';

class RecipeService {
  Future<List<Recipe>> loadRecipes() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Recipe.fromJson(json)).toList();
  }

  Future<List<RecipeType>> loadRecipeTypes() async {
    final String response = await rootBundle.loadString('assets/recipetypes.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => RecipeType.fromJson(json)).toList();
  }
}
