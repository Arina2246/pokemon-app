import 'package:either_dart/src/either.dart';
import 'package:pokemon_app/features/pokemon_list/data/data_sources/pokemon_list/local/pokemon_hive_service.dart';
import 'dart:convert';
import 'package:pokemon_app/features/pokemon_list/data/data_sources/pokemon_list/remote/pokemon_api_service.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/error.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/domain/repository/pokemon_list_repository.dart';

class PokemonListRepositoryImpl implements PokemonListRepository {
  @override
  Future<Either<Failure, PokemonListEntity>> getPokemonList(
      {required String url}) async {
    try {
      final response = await PokemonApiService.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        PokemonListModel pokemons = PokemonListModel.fromJson(json);
        await PokemonHiveService().putData(url, pokemons);
        return Right(pokemons);
      } else {
        return const Left(Failure(message: 'Failed to parse json response'));
      }
    } catch (e) {
      var cachedData = await PokemonHiveService().getData(url);
      if (cachedData != null) {
        return Right(cachedData);
      } else {
        return const Left(Failure(message: 'Something went wrong'));
      }
    }
  }
}
