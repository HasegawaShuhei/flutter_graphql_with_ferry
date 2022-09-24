import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screen/detail_screen/detail_screen.dart';
import '../screen/list_screen/list_screen.dart';
import 'not_found_screen.dart';

enum AppRoute {
  list,
  detail,
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.list.name,
          builder: (context, state) => const PokemonListScreen(),
          routes: [
            GoRoute(
              path: 'detail/:id',
              name: AppRoute.detail.name,
              pageBuilder: (context, state) {
                final pokemonId = state.params['id']!;
                return MaterialPage<void>(
                  key: state.pageKey,
                  child: PokemonDetailScreen(pokemonId: pokemonId),
                );
              },
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => const NotFoundScreen(),
    );
  },
);
