import 'package:flutter/material.dart';
import 'package:recipe_flutter_bloc/user/user.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => UserList());
    }

    if (settings.name == AddUpdateUser.routeName) {
      final UserArgument args = settings.arguments as UserArgument;
      return MaterialPageRoute(
        builder: (context) => AddUpdateUser(args: args),
      );
    }

    if (settings.name == UserDetail.routeName) {
      final args = settings.arguments as UserArgument;
      return MaterialPageRoute(
        builder: (context) => UserDetail(
          user: args.user!,
        ),
      );
    }

    return MaterialPageRoute(builder: (context) => UserList());
  }
}

class UserArgument {
  final User? user;
  final bool edit;

  UserArgument({this.user, this.edit = false});
}
