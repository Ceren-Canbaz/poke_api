import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_api/old/pokemon_home_view.dart';
import 'package:poke_api/view/pokemon_detail.dart';
import 'package:poke_api/view/pokemon_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: "details",
            path: "details/:name",
            builder: (context, state) {
              return DetailPage(
                name: state.params["name"]!,
              );
            },
          ),
        ],
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Pokemon App',
      theme: ThemeData.dark(),
    );
  }
}
