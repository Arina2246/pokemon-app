import 'package:either_dart/either.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/error.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_list.dart';

abstract class PokemonListRepository {
  Future<Either<Failure, PokemonListEntity>> getPokemonList(
      {required String url});
}
