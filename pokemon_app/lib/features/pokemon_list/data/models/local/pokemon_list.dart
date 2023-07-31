import 'package:hive/hive.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/local/pokemon.dart';
part 'pokemon_list.g.dart';

@HiveType(typeId: 0)
class PokemonListLocal {
  @HiveField(0)
  List<PokemonLocal> pokemonList;

  @HiveField(1)
  String next;

  @HiveField(2)
  int count;

  @HiveField(3)
  String previous;

  PokemonListLocal({
    required this.pokemonList,
    required this.next,
    required this.count,
    required this.previous,
  });
}
