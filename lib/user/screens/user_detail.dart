import 'package:flutter/material.dart';
import 'package:recipe_flutter_bloc/app_route.dart';
import 'package:recipe_flutter_bloc/user/user.dart';

class UserDetail extends StatefulWidget {
  static const routeName = '/userDetail';

  final User user;

  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(AddUpdateUser.routeName,
                  arguments: UserArgument(user: widget.user, edit: true));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${widget.user.name}'),
              Text('${widget.user.username}'),
              Text('${widget.user.email}'),
            ],
          ),
        ),
      ),
    );
  }
}
