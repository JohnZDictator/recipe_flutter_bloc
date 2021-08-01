import 'package:flutter/material.dart';
import 'package:recipe_flutter_bloc/recipe/recipe.dart';

class RecipeAppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => RecipeList());
    }

    if (settings.name == AddUpdateRecipe.routeName) {
      final RecipeArguments args = settings.arguments as RecipeArguments;
      return MaterialPageRoute(
        builder: (context) => AddUpdateRecipe(
          recipe: args.recipe,
          edit: args.edit,
        ),
      );
    }

    if (settings.name == RecipeDetail.routeName) {
      final RecipeArguments args = settings.arguments as RecipeArguments;
      return MaterialPageRoute(
        builder: (context) => RecipeDetail(
          recipe: args.recipe,
        ),
      );
    }

    return MaterialPageRoute(builder: (context) => RecipeList());
  }
}

class RecipeArguments {
  final Recipe recipe;

  final bool edit;

  RecipeArguments({required this.recipe, this.edit = false});
}
