import 'package:pokemon_app/features/pokemon_list/data/models/pokemon.dart';
import 'package:equatable/equatable.dart';

class PokemonsListModel extends Equatable {
  final List<PokemonModel>? pokemonList;
  final int? count;
  final String? next;
  final String? previous;

  const PokemonsListModel(
      {required this.pokemonList,
      required this.count,
      required this.next,
      required this.previous});

  @override
  List<Object?> get props => [pokemonList, count, next, previous];

  factory PokemonsListModel.fromJson(Map<String, dynamic> json) {
    return PokemonsListModel(
        pokemonList: parseProducts(json['results']),
        count: json['count'],
        next: json['next'],
        previous: json['previous']);
  }

  static List<PokemonModel> parseProducts(List<dynamic> p) {
    return List.generate(p.length, (index) => PokemonModel.fromJson(p[index]));
  }
}
