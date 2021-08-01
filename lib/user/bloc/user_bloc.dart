import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter_bloc/user/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoad) {
      yield UserLoading();
      try {
        final users = await userRepository.getUsers();
        yield UserLoadSuccess(users);
      } catch (e) {
        print('error message to yohannes: ' + e.toString());
        yield UserOperationFailure();
      }
    }

    if (event is UserCreate) {
      yield UserLoading();
      try {
        await userRepository.createUser(event.user);
        final users = await userRepository.getUsers();
        yield UserLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserUpdate) {
      yield UserLoading();
      try {
        await userRepository.updateUser(event.user);
        final users = await userRepository.getUsers();
        yield UserLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      yield UserLoading();
      try {
        await userRepository.deleteUser(event.user.id);
        final users = await userRepository.getUsers();
        yield UserLoadSuccess(users);
      } catch (_) {
        yield UserOperationFailure();
      }
    }
  }
}
