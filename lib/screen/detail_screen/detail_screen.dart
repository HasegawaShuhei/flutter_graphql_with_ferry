import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/__generated__/pokemon_detail.data.gql.dart';
import '../../graphql/__generated__/pokemon_detail.req.gql.dart';
import '../../graphql/__generated__/pokemon_detail.var.gql.dart';
import '../../graphql/client/graphql_client.dart';

/// ferry_flutterが用意してくれているOperation widgetを使うパターン

class PokemonDetailScreen extends HookConsumerWidget {
  const PokemonDetailScreen({
    super.key,
    required this.pokemonId,
  });

  final String pokemonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(graphqlClientProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Pokemon'),
      ),
      body: Operation<GPokemonDetailData, GPokemonDetailVars>(
        client: client,
        operationRequest: GPokemonDetailReq(
          (b) => b..vars.id = pokemonId,
        ),
        builder: (context, response, error) {
          if (response == null) {
            return const SizedBox.shrink();
          }
          if (response.hasErrors) {
            /// snackbarなどを表示
            return const SizedBox.shrink();
          }
          if (response.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final pokemon = response.data?.pokemon;

          return Center(
            child: Text(pokemon!.name),
          );
        },
      ),
    );
  }
}
