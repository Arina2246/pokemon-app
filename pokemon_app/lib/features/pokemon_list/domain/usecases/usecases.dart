import 'package:either_dart/either.dart';
import 'package:pokemon_app/core/usecase/usecase.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/error.dart';
import 'package:pokemon_app/features/pokemon_list/data/repository/pokemon_list_repository_iml.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_list.dart';

class GetPokemonListUseCase
    implements UseCase<Either<Failure, PokemonListEntity>, String> {
  final PokemonListRepositoryImpl _pokemonListRepositoryImp;

  GetPokemonListUseCase(this._pokemonListRepositoryImp);

  @override
  Future<Either<Failure, PokemonListEntity>> call({String params = ''}) {
    return _pokemonListRepositoryImp.getPokemonList(url: params);
  }
}
