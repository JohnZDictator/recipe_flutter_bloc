import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter_bloc/recipe/recipe.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository recipeRepository;

  RecipeBloc({required this.recipeRepository}) : super(RecipeLoading());

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is RecipeLoad) {
      yield RecipeLoading();
      try {
        final recipes = await recipeRepository.getRecipes();
        yield RecipeLoadSuccess(recipes);
      } catch (_) {
        yield RecipeOperationFailure();
      }
    }

    if (event is RecipeCreate) {
      yield RecipeLoading();
      try {
        await recipeRepository.createRecipe(event.recipe);
        final recipes = await recipeRepository.getRecipes();
        yield RecipeLoadSuccess(recipes);
      } catch (_) {
        yield RecipeOperationFailure();
      }
    }

    if (event is RecipeUpdate) {
      yield RecipeLoading();
      try {
        await recipeRepository.updateRecipe(event.recipe);
        final recipes = await recipeRepository.getRecipes();
        yield RecipeLoadSuccess(recipes);
      } catch (_) {
        yield RecipeOperationFailure();
      }
    }
    if (event is RecipeDelete) {
      yield RecipeLoading();
      try {
        await recipeRepository.deleteRecipe(event.recipe.id!);
        final recipes = await recipeRepository.getRecipes();
        yield RecipeLoadSuccess(recipes);
      } catch (_) {
        yield RecipeOperationFailure();
      }
    }
  }
}
