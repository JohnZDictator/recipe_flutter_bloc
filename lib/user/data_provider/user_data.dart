import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipe_flutter_bloc/user/user.dart';

class UserDataProvider {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  final http.Client httpClient;

  UserDataProvider({required this.httpClient});

  Future<List<User>> getUsers() async {
    var url = Uri.parse(_baseUrl + '/users');
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load Users');
    }
  }

  Future<User> getUser(int id) async {
    final response = await httpClient.get(Uri.http(_baseUrl, '/users/$id'));

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      return User.fromJson(user);
    } else {
      throw Exception('Failed to load a User');
    }
  }

  Future<User> createUser(User user) async {
    final response = await httpClient.post(
      Uri.http(_baseUrl, '/users'),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, dynamic>{
        'id': user.id,
        'name': user.name,
        'username': user.username,
        'email': user.email,
        // 'address': user.address
      }),
    );

    if (response.statusCode == 200) {
      final userCreated = jsonDecode(response.body);
      return User.fromJson(userCreated);
    } else {
      throw Exception('Failed to create User');
    }
  }

  Future<void> updateUser(User user) async {
    final response = await httpClient.put(
      Uri.http(_baseUrl, '/users/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'id': user.id,
        'name': user.name,
        'username': user.username,
        'email': user.email,
        // 'address': user.address
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to Update User');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await httpClient.delete(
      Uri.http(_baseUrl, '/users/$id'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to Delete User');
    }
  }
}
