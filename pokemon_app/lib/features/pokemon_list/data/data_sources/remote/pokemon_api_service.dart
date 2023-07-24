import 'package:http/http.dart' as http;

import '../../../../../core/constants/constants.dart';

abstract class PokemonsApiService {
  static Future get(int offsetQuery) async {
    var uri = Uri.parse(
        "$pokemonsURL/pokemon?offset=${offsetQuery.toString()}=$limitQuery");
    final response = await http.get(uri);
    return response;
  }
}
