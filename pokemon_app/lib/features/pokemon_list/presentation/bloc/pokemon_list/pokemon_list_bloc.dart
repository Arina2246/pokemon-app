import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/data/repository/pokemon_list_repository_iml.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_list.dart';

import '../../../../../core/constants/constants.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListEntity pokemonList = const PokemonListEntity(
    pokemonList: [],
    count: 0,
    next: initialPokemonURL,
    previous: null,
  );
  PokemonListBloc() : super(PokemonListInitial()) {
    on<PokemonListEvent>((event, emit) async {
      if (event is PokemonListLoadEvent) {
        bool isInitial = pokemonList.previous == null;
        isInitial
            ? emit(PokemonListInitialLoading(message: 'Fetching pokemons....'))
            : emit(PokemonListLoaded(
                pokemonList: pokemonList,
                loading: LoadingMore(message: 'Fetching more pokemons...')));
        final response = await PokemonListRepositoryImpl()
            .getPokemonList(url: pokemonList.next ?? initialPokemonURL);
        response.fold(
            (l) => isInitial
                ? emit(
                    PokemonListInitialError(message: 'Failed to load pokemons'))
                : emit(PokemonListLoaded(
                    pokemonList: pokemonList,
                    error: LoadMoreError(
                        message: 'Failed to load more pokemons'))), (r) {
          pokemonList = PokemonListModel(
            pokemonList: pokemonList.pokemonList! + r.pokemonList!,
            count: r.count,
            next: r.next,
            previous: r.previous,
          );
          emit(PokemonListLoaded(pokemonList: pokemonList));
        });
      }
    });
  }
}
