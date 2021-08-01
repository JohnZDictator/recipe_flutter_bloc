import 'package:flutter/material.dart';
import 'package:recipe_flutter_bloc/recipe/recipe.dart';

class RecipeDetail extends StatefulWidget {
  static const routeName = 'courseDetail';
  final Recipe? recipe;
  final bool edit = false;

  const RecipeDetail({required this.recipe});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
