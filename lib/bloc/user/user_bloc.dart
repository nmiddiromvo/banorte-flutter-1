import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myexample/bloc/user/user_event.dart';
import 'package:myexample/bloc/user/user_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, hasError: false));

      try {
        await Future.delayed(const Duration(seconds: 2)); // Simulo un endpoint
        final users = ['User 1', 'User 2', 'User 3']; // Ejemplo de response
        emit(state.copyWith(isLoading: false, users: users));
      } catch (_) {
        emit(state.copyWith(isLoading: false, hasError: true));
      }
    });
  }
}
