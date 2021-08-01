import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter_bloc/app_route.dart';
import 'package:recipe_flutter_bloc/user/user.dart';

class UserList extends StatefulWidget {
  static const routeName = '/';

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, state) {
              if (state is UserOperationFailure) {
                return Text('Could Not Do a User Operation');
              }

              if (state is UserLoadSuccess) {
                final users = state.user;

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (_, idx) => ListTile(
                    title: Text('${users[idx].name}'),
                    subtitle: Text('${users[idx].username}'),
                    onTap: () => Navigator.of(context).pushNamed(
                      UserDetail.routeName,
                      arguments: UserArgument(user: users[idx], edit: false),
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
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddUpdateUser.routeName,
              arguments: UserArgument(edit: false));
        },
      ),
    );
  }
}
