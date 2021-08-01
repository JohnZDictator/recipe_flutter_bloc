import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter_bloc/app_route.dart';
import 'package:recipe_flutter_bloc/user/user.dart';

class AddUpdateUser extends StatefulWidget {
  static const routeName = 'userAddUpdate';

  final UserArgument args;

  const AddUpdateUser({required this.args});
  @override
  _AddUpdateUserState createState() => _AddUpdateUserState();
}

class _AddUpdateUserState extends State<AddUpdateUser> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.edit ? 'Update User' : 'Add User'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter ID';
                    }
                    return null;
                  },
                  // initialValue:
                  //     widget.args.edit ? widget.args.user!.id.toString() : '',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  // initialValue: widget.args.edit ? widget.args.user!.name : '',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  // initialValue:
                  //     widget.args.edit ? widget.args.user!.username : '',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                  // initialValue: widget.args.edit ? widget.args.user!.email : '',
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submitForm() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();

      final UserEvent event = widget.args.edit
          ? UserUpdate(
              User(
                id: widget.args.user!.id,
                name: _nameController.text,
                username: _usernameController.text,
                email: _emailController.text,
              ),
            )
          : UserCreate(
              User(
                id: int.parse(_idController.text),
                name: _nameController.text,
                username: _usernameController.text,
                email: _emailController.text,
              ),
            );
      print('before brrr');
      BlocProvider.of<UserBloc>(context).add(event);
      print('after brrr');
      Navigator.of(context)
          .pushNamedAndRemoveUntil(UserList.routeName, (route) => false);
    }
  }
}
