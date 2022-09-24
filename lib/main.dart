import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'graphql/client/graphql_client.dart';
import 'router/app_router.dart';

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

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      title: 'Flutter GraphQL with ferry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
