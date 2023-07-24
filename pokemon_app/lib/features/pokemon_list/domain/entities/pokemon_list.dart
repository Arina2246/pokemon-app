import 'package:pokemon_app/features/pokemon_list/data/models/pokemon.dart';
import 'package:equatable/equatable.dart';

class PokemonsListEntity extends Equatable {
  final List<PokemonModel>? pokemonList;
  final int? count;
  final String? next;
  final String? previous;

  const PokemonsListEntity(
      {this.pokemonList, this.count, this.next, this.previous});

  @override
  List<Object?> get props => [pokemonList, count, next, previous];
}
