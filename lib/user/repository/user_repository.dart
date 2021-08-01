import 'package:recipe_flutter_bloc/user/user.dart';

class UserRepository {
  final UserDataProvider userDataProvider;

  UserRepository({required this.userDataProvider});

  Future<List<User>> getUsers() async {
    return await userDataProvider.getUsers();
  }

  Future<User> getUser(int id) async {
    return await userDataProvider.getUser(id);
  }

  Future<User> createUser(User user) async {
    return await userDataProvider.createUser(user);
  }

  Future<void> updateUser(User user) async {
    return await userDataProvider.updateUser(user);
  }

  Future<void> deleteUser(int id) async {
    return await userDataProvider.deleteUser(id);
  }
}
