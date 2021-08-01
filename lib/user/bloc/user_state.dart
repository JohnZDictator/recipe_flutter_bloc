import 'package:equatable/equatable.dart';
import 'package:recipe_flutter_bloc/user/user.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> user;

  const UserLoadSuccess([this.user = const []]);

  @override
  List<Object?> get props => [user];
}

class UserOperationFailure extends UserState {}
