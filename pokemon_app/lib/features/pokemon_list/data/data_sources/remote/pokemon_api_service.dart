import 'package:http/http.dart' as http;

import '../../../../../core/constants/constants.dart';

abstract class PokemonApiService {
  static Future get(int offsetQuery) async {
    var uri = Uri.parse(
        "$pokemonURL/pokemon?offset=${offsetQuery.toString()}=$limitQuery");
    final response = await http.get(uri);
    return response;
  }
}
