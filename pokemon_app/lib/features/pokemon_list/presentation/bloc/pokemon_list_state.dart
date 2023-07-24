part of 'pokemon_list_bloc.dart';

@immutable
abstract class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListInitialLoading extends PokemonListState {
  final String message;
  PokemonListInitialLoading({required this.message});
}

class PokemonListInitialError extends PokemonListState {
  final String message;
  PokemonListInitialError({required this.message});
}

class PokemonListEmpty extends PokemonListState {}

class PokemonListLoaded extends PokemonListState {
  final PokemonListEntity pokemonList;
  final LoadingMore? loading;
  final LoadMoreError? error;
  PokemonListLoaded({
    required this.pokemonList,
    this.loading,
    this.error,
  });
}

class LoadingMore {
  final String message;
  LoadingMore({required this.message});
}

class LoadMoreError {
  final String message;
  LoadMoreError({required this.message});
}
