import 'package:hive/hive.dart';
part 'pokemon.g.dart';

@HiveType(typeId: 1)
class PokemonLocal {
  @HiveField(0)
  String name;

  @HiveField(1)
  String url;

  PokemonLocal({
    required this.name,
    required this.url,
  });
}
