import 'package:either_dart/src/either.dart';
import 'package:pokemon_app/features/pokemon_list/data/data_sources/pokemon_details/local/pokemon_details_hive_service.dart';
import 'dart:convert';
import 'package:pokemon_app/features/pokemon_list/data/data_sources/pokemon_details/remote/pokemon_details_api_service.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/error.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/pokemon_details.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_details.dart';
import 'package:pokemon_app/features/pokemon_list/domain/repository/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  @override
  Future<Either<Failure, PokemonDetailsEntity>> getPokemonDetails(
      {required String url}) async {
    try {
      final response = await PokemonDetailsApiService.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        PokemonDetailsModel pokemonDetails = PokemonDetailsModel.fromJson(json);
        await PokemonDetailsHiveService().putData(url, pokemonDetails);
        return Right(pokemonDetails);
      } else {
        return const Left(Failure(message: 'Failed to parse json response'));
      }
    } catch (e) {
      var cachedData = await PokemonDetailsHiveService().getData(url);
      if (cachedData != null) {
        return Right(cachedData);
      } else {
        return const Left(Failure(message: 'Something went wrong'));
      }
    }
  }
}
