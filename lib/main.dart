import 'package:flutter/material.dart';
import 'pages/recipe_list_page.dart';
import 'pages/recipe_form_page.dart';
import 'pages/recipe_detail_page.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RecipeListPage(),
        '/new_recipe': (context) => RecipeFormPage(),
        '/edit_recipe': (context) => RecipeFormPage(),
        '/recipe_detail': (context) => RecipeDetailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
