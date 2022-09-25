import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/__generated__/all_pokemon.data.gql.dart';
import '../../router/app_router.dart';
import 'pokemons_provider.dart';

/// streamProviderを使うパターン

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('ポケモン一覧'),
              floating: true,
            ),
            _PokemonListScreenBody(),
          ],
        ),
      ),
    );
  }
}

final _pokemonProvider = Provider<GAllPokemonData_pokemons_results>(
  (ref) => throw UnimplementedError(),
);

class _PokemonListScreenBody extends HookConsumerWidget {
  const _PokemonListScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemons = ref.watch(pokemonsProvider);
    return pokemons.when(
      data: (data) {
        return SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProviderScope(
                overrides: [
                  _pokemonProvider.overrideWithValue(data[index]),
                ],
                child: const _PokemonListTile(),
              ),
              childCount: data!.length,
            ),
          ),
        );
      },
      error: (e, st) => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(e.toString()),
        ),
      ),
      loading: () => const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _PokemonListTile extends HookConsumerWidget {
  const _PokemonListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(_pokemonProvider);
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
