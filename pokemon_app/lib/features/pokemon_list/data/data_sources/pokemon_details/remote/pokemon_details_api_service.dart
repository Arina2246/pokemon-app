import 'package:http/http.dart' as http;

abstract class PokemonDetailsApiService {
  static Future get(String url) async {
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    return response;
  }
}
