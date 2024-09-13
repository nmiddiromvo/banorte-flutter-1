import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myexample/bloc/post/post_bloc.dart';
import 'package:myexample/screen/details_screen.dart';
import 'package:myexample/screen/home_screen.dart';
import 'package:myexample/screen/second_screen.dart';
import 'package:myexample/screen/user_bloc_screen.dart';

void main() async {
  // Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/second',
        builder: (context, state) => const SecondScreen(),
      ),
      GoRoute(
        path: '/blocExample',
        builder: (context, state) => const UserBlocScreen(),
        pageBuilder: (context, state) => CupertinoPage(
          fullscreenDialog: true,
          child: const UserBlocScreen(),
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/details/:id', // Deep linking route with parameter
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return DetailsScreen(id: id!);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => PostBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        title: 'App Example',
        theme: ThemeData(
            // primarySwatch: Colors.blue, // Color principal del tema
            // brightness: Brightness.light, // Tema claro u oscuro
            // textTheme: TextTheme(
            //   bodyLarge: const TextStyle(fontSize: 18, color: Colors.black),
            //   bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[700]),
            // ),
            // scaffoldBackgroundColor: Colors.black,
            // elevatedButtonTheme: ElevatedButtonThemeData(
            //   style: ElevatedButton.styleFrom(
            //     foregroundColor: Colors.white, // Color del texto en el botón
            //     backgroundColor: Colors.red, // Color del botón
            //   ),
            // ),
            ),
      ),
    );
  }
}
