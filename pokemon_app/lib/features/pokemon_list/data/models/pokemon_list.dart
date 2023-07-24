import 'package:pokemon_app/features/pokemon_list/data/models/pokemon.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_list.dart';

class PokemonListModel extends PokemonListEntity {
  const PokemonListModel({
    List<PokemonModel>? pokemonList,
    int? count,
    String? next,
    String? previous,
  }) : super(
          pokemonList: pokemonList,
          count: count,
          next: next,
          previous: previous,
        );

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    return PokemonListModel(
        pokemonList: parseProducts(json['results']),
        count: json['count'],
        next: json['next'],
        previous: json['previous']);
  }

  static List<PokemonModel> parseProducts(List<dynamic> p) {
    return List.generate(p.length, (index) => PokemonModel.fromJson(p[index]));
  }
}
