part of 'pokemon_details_bloc.dart';

@immutable
abstract class PokemonDetailsState {}

class PokemonDetailsInitial extends PokemonDetailsState {
  final String? url;
  PokemonDetailsInitial({this.url});
}

class PokemonDetailsLoading extends PokemonDetailsState {
  final String message;
  PokemonDetailsLoading({required this.message});
}

class PokemonDetailsError extends PokemonDetailsState {
  final String message;
  PokemonDetailsError({required this.message});
}

class PokemonDetailsLoaded extends PokemonDetailsState {
  final PokemonDetailsEntity pokemonDetails;
  PokemonDetailsLoaded({
    required this.pokemonDetails,
  });
}
