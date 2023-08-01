import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/local/pokemon_details.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/remote/pokemon_details.dart';

class PokemonDetailsHiveService {
  Box box = Hive.box<PokemonDetailsLocal>('pokemonDetails');
  Future getData(url) async {
    var data = box.get(url);

    if (data != null) {
      // List<PokemonModel> pokemonList = List.generate(
      //     data.pokemonList!.length,
      //     (index) => PokemonModel(
      //         name: data.pokemonList![index].name!,
      //         url: data.pokemonList![index].url!));

      PokemonDetailsModel dataObj = PokemonDetailsModel(
        name: data.name,
        img: data.img,
        weight: data.weight,
        height: data.height,
        types: data.types,
      );
      return dataObj;
    } else {
      return null;
    }
  }

  Future putData(url, PokemonDetailsModel data) async {
    // List<dynsmic> TypesList = List.generate(
    //     data.types!.length,
    //     (index) => PokemonLocal(
    //         name: data.types![index].name!));
    box.put(
        url,
        PokemonDetailsLocal(
          name: data.name!,
          img: data.img!,
          weight: data.weight!,
          height: data.height!,
          types: data.types!,
        ));
  }
}
