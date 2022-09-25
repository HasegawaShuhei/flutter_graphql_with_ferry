import 'package:ferry/ferry.dart' as ferry;
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final graphqlClientProvider =
    Provider<ferry.Client>((ref) => throw UnimplementedError());

Future<ferry.Client> initClient() async {
  await Hive.initFlutter();

  final box = await Hive.openBox<dynamic>('graphql');

  final store = HiveStore(box);

  final cache = ferry.Cache(store: store);

  final link = HttpLink('https://pokeapi.dev/');

  return ferry.Client(
    link: link,
    cache: cache,
  );
}
