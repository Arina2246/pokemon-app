import 'package:either_dart/either.dart';
import 'package:pokemon_app/core/usecase/usecase.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/error.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/domain/repository/pokemon_list_repository.dart';

class GetPokemonListUseCase
    implements UseCase<Either<Failure, PokemonListEntity>, int> {
  final PokemonListRepository _pokemonListRepository;

  GetPokemonListUseCase(this._pokemonListRepository);

  @override
  Future<Either<Failure, PokemonListEntity>> call({int params = 0}) {
    return _pokemonListRepository.getPokemonList(offset: params);
  }
}
