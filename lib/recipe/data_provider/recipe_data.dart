import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_flutter_bloc/recipe/recipe.dart';

class RecipeDataProvider {
  final _baseUrl = 'http://10.0.2.2:5000';
  final http.Client httpClient;

  RecipeDataProvider({required this.httpClient});

  Future<Recipe> createRecipe(Recipe recipe) async {
    final response = await httpClient.post(
      Uri.http('10.0.2.2:5000', '/api/recipe'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth-token': '',
      },
      body: jsonEncode(<String, dynamic>{
        'title': recipe.title,
        'description': recipe.description,
        // 'image': recipe.image,
        'Chef': recipe.recipeOwner,
      }),
    );

    if (response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Recipe');
    }
  }

  Future<List<Recipe>> getRecipes() async {
    var url = Uri.parse(_baseUrl + '/api/recipe');
    final response = await httpClient.get(url);
    print('hello there');

    if (response.statusCode == 200) {
      final recipes = jsonDecode(response.body) as List;
      return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
    } else {
      throw Exception('Failed to load Recipe');
    }
  }

  Future<Recipe> getRecipe(String id) async {
    final response = await httpClient.get(
      Uri.http(_baseUrl, '/api/recipe/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Recipe');
    }
  }

  Future<void> updateRecipe(Recipe recipe) async {
    final response = await httpClient.put(
      Uri.http(_baseUrl, '/api/recipe/${recipe.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth-token': ''
      },
      body: jsonEncode(<String, dynamic>{
        'title': recipe.title,
        'description': recipe.description,
        // 'image': recipe.image,
        'Chef': recipe.recipeOwner,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to Update Recipe');
    }
  }

  Future<void> deleteRecipe(String id) async {
    final response = await httpClient.delete(
      Uri.http(_baseUrl, '/api/recipe/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth-token': '',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to Delete Recipe');
    }
  }
}
