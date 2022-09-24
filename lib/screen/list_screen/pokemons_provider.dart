import 'package:built_collection/built_collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/__generated__/all_pokemon.data.gql.dart';
import '../../graphql/__generated__/all_pokemon.req.gql.dart';
import '../../graphql/client/graphql_client.dart';

final pokemonsProvider =
    StreamProvider<BuiltList<GAllPokemonData_pokemons_results>?>((ref) {
  final client = ref.watch(graphqlClientProvider);
  final req = GAllPokemonReq(
    (b) => b
      ..vars.limit = 50
      ..vars.offset = 0,
  );
  final stream = client.request(req);
  return stream.map((response) {
    final data = response.data;
    if (response.hasErrors) {
      throw Exception('エラーが発生しました');
    }
    if (data == null) {
      throw Exception('データが見つかりませんでした。');
    }
    return response.data!.pokemons!.results;
  });
});
