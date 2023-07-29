part of 'pokemon_list_bloc.dart';

@immutable
abstract class PokemonListEvent {}

class PokemonListLoadEvent extends PokemonListEvent {
  final bool isInitial;
  PokemonListLoadEvent(this.isInitial);
}
