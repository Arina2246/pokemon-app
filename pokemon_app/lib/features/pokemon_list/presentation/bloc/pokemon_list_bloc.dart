import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_list.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListEntity pokemonList = const PokemonListEntity(
    pokemonList: [],
    count: 0,
    next: '',
    previous: null,
  );
  PokemonListBloc() : super(PokemonListInitial()) {
    on<PokemonListEvent>((event, emit) {});
  }
}
