import 'package:bloc_test/bloc_test.dart';
import 'package:myexample/bloc/user/user_bloc.dart';
import 'package:myexample/bloc/user/user_event.dart';
import 'package:myexample/bloc/user/user_state.dart';
import 'package:test/test.dart';

void main() {
  group('UsersBloc', () {
    test('initial state is correct', () {
      expect(
        UsersBloc().state,
        const UsersState(isLoading: false, users: [], hasError: false),
      );
    });

    blocTest<UsersBloc, UsersState>(
      'emits [isLoading: true] when LoadUsersEvent is added',
      build: () => UsersBloc(),
      act: (bloc) => bloc.add(LoadUsersEvent()),
      expect: () => [
        const UsersState(isLoading: true, users: [], hasError: false),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'emits [isLoading: true] then success state when LoadUsersEvent is added',
      build: () => UsersBloc(),
      act: (bloc) => bloc.add(LoadUsersEvent()),
      wait: const Duration(
          seconds:
              2), // espero el tiempo que suponemos que tarda en responder la API
      expect: () => [
        const UsersState(isLoading: true, users: [], hasError: false),
        isA<UsersState>()
            .having((state) => state.isLoading, 'isLoading', false)
            .having((state) => state.users, 'users', isNotEmpty)
            .having((state) => state.hasError, 'hasError', false),
      ],
    );
  });
}
