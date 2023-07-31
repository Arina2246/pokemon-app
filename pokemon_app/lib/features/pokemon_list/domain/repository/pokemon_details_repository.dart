import 'package:either_dart/either.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/error.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_details.dart';

abstract class PokemonDetailsRepository {
  Future<Either<Failure, PokemonDetailsEntity>> getPokemonDetails(
      {required String url});
}
