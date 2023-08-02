part of 'pokemon_details_bloc.dart';

@immutable
abstract class PokemonDetailsEvent {}

class PokemonDetailsLoadEvent extends PokemonDetailsEvent {}

class GetUrl extends PokemonDetailsEvent {
  final String url;
  GetUrl(this.url);
}
