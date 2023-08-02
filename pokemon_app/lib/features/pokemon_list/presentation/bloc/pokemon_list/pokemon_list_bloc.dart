import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/data/repository/pokemon_list_repository_iml.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/domain/usecases/usecases.dart';

import '../../../../../core/constants/constants.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  bool isInitial = true;
  PokemonListEntity pokemonList = const PokemonListEntity(
    pokemonList: [],
    count: 0,
    next: initialPokemonURL,
    previous: null,
  );
  PokemonListBloc() : super(PokemonListInitial()) {
    on<PokemonListEvent>((event, emit) async {
      if (event is PokemonListLoadEvent) {
        isInitial = event.isInitial;
        final response =
            await GetPokemonListUseCase(PokemonListRepositoryImpl())
                .call(params: pokemonList.next ?? initialPokemonURL);
        response.fold(
            (l) => emit(
                PokemonListInitialError(message: 'Failed to load pokemons')),
            (r) => {
                  if (isInitial)
                    {
                      pokemonList = PokemonListModel(
                        pokemonList: r.pokemonList,
                        count: r.count,
                        next: r.next,
                        previous: r.previous,
                      ),
                      if (pokemonList.pokemonList!.isEmpty)
                        {emit(PokemonListEmpty())},
                    }
                  else
                    {
                      pokemonList = PokemonListModel(
                        pokemonList: pokemonList.pokemonList! + r.pokemonList!,
                        count: r.count,
                        next: r.next,
                        previous: r.previous,
                      ),
                    },
                  emit(PokemonListLoaded(pokemonList: pokemonList))
                });
      }
    });
  }
}
