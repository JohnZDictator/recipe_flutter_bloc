import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  // final List address;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    // required this.address,
  });

  @override
  List<Object?> get props => [id, name, username, email];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      // address: json['address'],
    );
  }

  @override
  String toString() =>
      'User {id: $id, name: $name, username: $username, email: $email}';
}
