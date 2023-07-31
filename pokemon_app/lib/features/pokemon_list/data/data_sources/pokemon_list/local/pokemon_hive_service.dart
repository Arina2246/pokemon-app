import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/local/pokemon.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/local/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/pokemon.dart';

class PokemonHiveService {
  Box box = Hive.box<PokemonListLocal>('pokemonList');
  Future getData(url) async {
    var data = box.get(url);

    if (data != null) {
      List<PokemonModel> pokemonList = List.generate(
          data.pokemonList!.length,
          (index) => PokemonModel(
              name: data.pokemonList![index].name!,
              url: data.pokemonList![index].url!));

      PokemonListModel dataObj = PokemonListModel(
        pokemonList: pokemonList,
        next: data.next,
        count: data.count,
        previous: data.previous,
      );
      return dataObj;
    } else {
      return null;
    }
  }

  Future putData(url, PokemonListModel data) async {
    List<PokemonLocal> pokemonList = List.generate(
        data.pokemonList!.length,
        (index) => PokemonLocal(
            name: data.pokemonList![index].name!,
            url: data.pokemonList![index].url!));
    box.put(
        url,
        PokemonListLocal(
          pokemonList: pokemonList,
          next: data.next!,
          count: data.count!,
          previous: data.previous ?? '',
        ));
  }
}
