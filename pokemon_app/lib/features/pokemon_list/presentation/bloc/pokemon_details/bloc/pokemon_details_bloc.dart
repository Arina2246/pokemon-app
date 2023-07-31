import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/pokemon_details.dart';
import 'package:pokemon_app/features/pokemon_list/data/repository/pokemon_details_repository.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_details.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  String url = '';
  PokemonDetailsEntity pokemonDetails = const PokemonDetailsEntity(
    types: [],
    name: '',
    img: '',
    weight: 0,
    height: 0,
  );

  PokemonDetailsBloc() : super(PokemonDetailsInitial()) {
    on<PokemonDetailsEvent>((event, emit) async {
      if (event is GetUrl) {
        url = event.url;
      }
      if (event is PokemonDetailsLoadEvent) {
        bool isInitial = pokemonDetails.name == '';
        isInitial
            ? emit(PokemonDetailsLoading(message: 'Fetching pokemons....'))
            : emit(PokemonDetailsLoaded(pokemonDetails: pokemonDetails));
        final response =
            await PokemonDetailsRepositoryImpl().getPokemonDetails(url: url);
        response.fold(
            (l) => isInitial
                ? emit(PokemonDetailsError(message: 'Failed to load pokemons'))
                : emit(PokemonDetailsLoaded(
                    pokemonDetails: pokemonDetails,
                  )), (r) {
          pokemonDetails = PokemonDetailsModel(
            name: r.name,
            img: r.img,
            weight: r.weight,
            height: r.height,
            types: r.types,
          );
          emit(PokemonDetailsLoaded(pokemonDetails: pokemonDetails));
        });
      }
    });
  }
}
