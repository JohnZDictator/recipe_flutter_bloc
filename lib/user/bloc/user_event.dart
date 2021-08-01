import 'package:equatable/equatable.dart';
import 'package:recipe_flutter_bloc/user/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoad extends UserEvent {
  const UserLoad();

  @override
  List<Object?> get props => [];
}

class UserCreate extends UserEvent {
  final User user;

  const UserCreate(this.user);

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'User created { user: $user}';
}

class UserUpdate extends UserEvent {
  final User user;

  const UserUpdate(this.user);

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'User Updated { user: $user}';
}

class UserDelete extends UserEvent {
  final User user;

  const UserDelete(this.user);

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'User Deleted { user: $user}';
}
