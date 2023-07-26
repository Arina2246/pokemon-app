import 'package:either_dart/src/either.dart';
import 'dart:convert';
import 'package:pokemon_app/features/pokemon_list/data/data_sources/remote/pokemon_api_service.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/error.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/pokemon_list.dart';
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
        PokemonListModel products = PokemonListModel.fromJson(json);
        return Right(products);
      } else {
        return const Left(Failure(message: 'Failed to parse json response'));
      }
    } catch (e) {
      return const Left(Failure(message: 'Something went wrong'));
    }
  }
}
