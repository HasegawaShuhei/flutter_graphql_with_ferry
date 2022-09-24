import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'graphql/client/graphql_client.dart';
import 'screen/list_screen/list_screen.dart';

Future<void> main() async {
  final client = await initClient();
  runApp(
    ProviderScope(
      overrides: [
        graphqlClientProvider.overrideWithValue(client),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GraphQl with ferry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokemonListScreen(),
    );
  }
}
