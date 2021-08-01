import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter_bloc/recipe/recipe.dart';

class RecipeList extends StatefulWidget {
  static const routeName = '/';
  late final Recipe recipe;

  @override
  RecipeListState createState() => RecipeListState();
}

class RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<RecipeBloc, RecipeState>(
            builder: (_, state) {
              if (state is RecipeOperationFailure) {
                return Center(child: Text('Could not do Recipe Operation'));
              }
              if (state is RecipeLoadSuccess) {
                final recipes = state.recipes;

                return ListView.builder(
                  itemBuilder: (_, idx) => ListTile(
                    title: Text('${recipes[idx].title}'),
                    subtitle: Text('${recipes[idx].description}'),
                    onTap: () => Navigator.of(context).pushNamed(
                      RecipeDetail.routeName,
                      arguments: recipes[idx],
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateRecipe.routeName,
          arguments: RecipeArguments(
              recipe: Recipe(
                title: '',
                description: '',
                recipeOwner: '',
              ),
              edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
