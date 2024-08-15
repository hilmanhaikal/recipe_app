import 'package:flutter/material.dart';
import '/models/recipe.dart';

class RecipeFormPage extends StatefulWidget {
  @override
  _RecipeFormPageState createState() => _RecipeFormPageState();
}

class _RecipeFormPageState extends State<RecipeFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _recipeName = '';
  String _recipeType = '';
  String _recipeImageUrl = '';
  List<String> _ingredients = [];
  List<String> _steps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Recipe')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Recipe Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the recipe name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _recipeName = value!;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Recipe Type'),
                  items: [
                    DropdownMenuItem(value: '1', child: Text('Breakfast')),
                    DropdownMenuItem(value: '2', child: Text('Lunch')),
                    DropdownMenuItem(value: '3', child: Text('Dinner')),
                    DropdownMenuItem(value: '4', child: Text('Dessert')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _recipeType = value!;
                    });
                  },
                ),
                _buildIngredientsSection(),
                _buildStepsSection(),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save the new recipe
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Save Recipe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Text(
          'Ingredients',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        for (int i = 0; i < _ingredients.length; i++)
          _buildIngredientItem(i),
        TextButton.icon(
          onPressed: () {
            setState(() {
              _ingredients.add('');
            });
          },
          icon: Icon(Icons.add),
          label: Text('Add Ingredient'),
        ),
      ],
    );
  }

  Widget _buildStepsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Text(
          'Steps',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        for (int i = 0; i < _steps.length; i++)
          _buildStepItem(i),
        TextButton.icon(
          onPressed: () {
            setState(() {
              _steps.add('');
            });
          },
          icon: Icon(Icons.add),
          label: Text('Add Step'),
        ),
      ],
    );
  }

  Widget _buildIngredientItem(int index) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: _ingredients[index],
            decoration: InputDecoration(labelText: 'Ingredient ${index + 1}'),
            onChanged: (value) {
              _ingredients[index] = value;
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              _ingredients.removeAt(index);
            });
          },
        ),
      ],
    );
  }

  Widget _buildStepItem(int index) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: _steps[index],
            decoration: InputDecoration(labelText: 'Step ${index + 1}'),
            onChanged: (value) {
              _steps[index] = value;
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              _steps.removeAt(index);
            });
          },
        ),
      ],
    );
  }
}
