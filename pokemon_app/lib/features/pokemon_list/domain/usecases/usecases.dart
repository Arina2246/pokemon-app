import 'package:either_dart/either.dart';
import 'package:pokemon_app/core/usecase/usecase.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/error.dart';
import 'package:pokemon_app/features/pokemon_list/data/repository/pokemon_details_repository.dart';
import 'package:pokemon_app/features/pokemon_list/data/repository/pokemon_list_repository_iml.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_details.dart';
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

class GetPokemonDetailstUseCase
    implements UseCase<Either<Failure, PokemonDetailsEntity>, String> {
  final PokemonDetailsRepositoryImpl _pokemonDetailsRepositoryImpl;

  GetPokemonDetailstUseCase(this._pokemonDetailsRepositoryImpl);

  @override
  Future<Either<Failure, PokemonDetailsEntity>> call({String params = ''}) {
    return _pokemonDetailsRepositoryImpl.getPokemonDetails(url: params);
  }
}
