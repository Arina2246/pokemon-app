import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    String? name,
    String? url,
  }) : super(
          name: name,
          url: url,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }
}
