import 'package:recipe_flutter_bloc/recipe/recipe.dart';

class RecipeRepository {
  final RecipeDataProvider recipeDataProvider;

  RecipeRepository({required this.recipeDataProvider});

  Future<Recipe> createRecipe(Recipe recipe) async {
    return await recipeDataProvider.createRecipe(recipe);
  }

  Future<List<Recipe>> getRecipes() async {
    return await recipeDataProvider.getRecipes();
  }

  Future<Recipe> getRecipe(String id) async {
    return await recipeDataProvider.getRecipe(id);
  }

  Future<void> updateRecipe(Recipe recipe) async {
    return await recipeDataProvider.updateRecipe(recipe);
  }

  Future<void> deleteRecipe(String id) async {
    return await recipeDataProvider.deleteRecipe(id);
  }
}
