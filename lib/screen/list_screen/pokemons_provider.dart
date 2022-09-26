import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/__generated__/all_pokemon.data.gql.dart';
import '../../graphql/__generated__/all_pokemon.req.gql.dart';
import '../../graphql/client/graphql_client.dart';
import '../../model/pagenated_response.dart';

final pagenatedPokemonsProvider = StreamProvider.family<
    PagenatedResponse<GAllPokemonData_pokemons_results>,
    int>((ref, int offset) {
  final client = ref.watch(graphqlClientProvider);
  final req = GAllPokemonReq(
    (b) => b
      ..requestId = 'pokemons'
      ..vars.limit = 50
      ..vars.offset = offset
      ..updateResult = (previous, result) {
        return previous?.rebuild(
              (b) => b
                ..pokemons.results.addAll(result!.pokemons!.results!)
                ..pokemons.update((b2) => b2.next = result.pokemons?.next),
            ) ??
            result;
      },
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
    final pokemons = response.data!.pokemons!;
    return PagenatedResponse(
      results: [...pokemons.results!],
      hasNext: pokemons.next != null,
    );
  });
});
