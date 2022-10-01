import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/__generated__/all_pokemon.data.gql.dart';
import '../../router/app_router.dart';
import 'pokemons_provider.dart';

/// streamProviderを使うパターン

class PokemonListScreen extends HookConsumerWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ポケモン一覧'),
      ),
      body: const SafeArea(
        top: false,
        child: _PokemonListScreenBody(),
      ),
    );
  }
}

final _currentPokemonProvider = Provider<GAllPokemonData_pokemons_results>(
  (ref) => throw UnimplementedError(),
);

class _PokemonListScreenBody extends HookConsumerWidget {
  const _PokemonListScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonList = ref.watch(pagenatedPokemonsProvider(0));
    return pokemonList.when(
      data: (pokemons) {
        final results = pokemons.results;
        return RefreshIndicator(
          onRefresh: () async =>
              ref.refresh(pagenatedPokemonsProvider(0).future),
          child: ListView.custom(
            padding: const EdgeInsets.all(8),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
                if (results.length - 1 == index && pokemons.hasNext) {
                  ref.refresh(pagenatedPokemonsProvider(results.length));
                  return const _LoadingWidget();
                }
                return ProviderScope(
                  overrides: [
                    _currentPokemonProvider.overrideWithValue(results[index]),
                  ],
                  child: const _PokemonListTile(),
                );
              },
              childCount: results.length,
            ),
          ),
        );
      },
      loading: () => const _LoadingWidget(),
      error: (e, st) => Center(
        child: Text(
          e.toString(),
        ),
      ),
    );
  }
}

class _PokemonListTile extends HookConsumerWidget {
  const _PokemonListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(_currentPokemonProvider);
    return GestureDetector(
      onTap: () => context.goNamed(
        AppRoute.detail.name,
        params: {'id': pokemon.id.toString()},
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Pokedex No.${pokemon.id}'),
                const SizedBox(width: 16),
                Text(pokemon.name),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('heiht:${pokemon.height!.in_meter}'),
                const SizedBox(width: 8),
                Text('weight:${pokemon.weight!.in_kg}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
