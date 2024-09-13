import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myexample/bloc/user/user_bloc.dart';
import 'package:myexample/bloc/user/user_event.dart';
import 'package:myexample/bloc/user/user_state.dart';

class UserBlocScreen extends StatelessWidget {
  const UserBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Bloc UI Example')),
      body: BlocProvider(
        create: (context) => UsersBloc(),
        child: Column(
          children: [
            const Row(),
            BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                return Column(
                  children: [
                    MaterialButton(
                      color: Colors.yellowAccent,
                      height: 50,
                      minWidth: 150,
                      child: state.isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text('Load Users',
                                  textAlign: TextAlign.center),
                            ),
                      onPressed: () {
                        context.read<UsersBloc>().add(LoadUsersEvent());
                      },
                    ),
                    SizedBox(
                      height: 400,
                      child: Expanded(
                        child: state.isLoading
                            ? const CircularProgressIndicator.adaptive()
                            : ListView.builder(
                                itemCount: state.users.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(state.users[index]),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go Back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
