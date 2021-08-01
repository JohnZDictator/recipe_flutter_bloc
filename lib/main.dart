import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_flutter_bloc/app_route.dart';

import 'package:recipe_flutter_bloc/bloc_observer.dart';
import 'package:recipe_flutter_bloc/recipe/recipe.dart';
import 'package:recipe_flutter_bloc/user/user.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  final RecipeRepository recipeRepository = RecipeRepository(
      recipeDataProvider: RecipeDataProvider(httpClient: http.Client()));

  final UserRepository userRepository = UserRepository(
      userDataProvider: UserDataProvider(httpClient: http.Client()));

  runApp(
    MyApp(
      recipeRepository: recipeRepository,
      userRepository: userRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final RecipeRepository recipeRepository;
  final UserRepository userRepository;

  MyApp({required this.recipeRepository, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RecipeRepository>(
          create: (_) => this.recipeRepository,
        ),
        RepositoryProvider<UserRepository>(
          create: (_) => this.userRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RecipeBloc>(
            create: (_) => RecipeBloc(recipeRepository: this.recipeRepository)
              ..add(RecipeLoad()),
          ),
          BlocProvider<UserBloc>(
              create: (_) => UserBloc(userRepository: this.userRepository)
                ..add(UserLoad()))
        ],
        child: MaterialApp(
          title: 'Recipe App',
          onGenerateRoute: AppRoute.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );

    // return RepositoryProvider.value(
    //   value: this.recipeRepository,
    //   child: BlocProvider(
    //     create: (context) => RecipeBloc(recipeRepository: this.recipeRepository)
    //       ..add(RecipeLoad()),
    //     child: MaterialApp(
    //       title: 'Recipe App',
    //       onGenerateRoute: RecipeAppRoute.generateRoute,
    //       debugShowCheckedModeBanner: false,
    //     ),
    //   ),
    // );
  }
}
