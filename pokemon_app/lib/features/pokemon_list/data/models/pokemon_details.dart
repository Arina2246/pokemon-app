import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_details.dart';

class PokemonDetailsModel extends PokemonDetailsEntity {
  const PokemonDetailsModel({
    String? name,
    String? img,
    int? weight,
    int? height,
    List<dynamic>? types,
  }) : super(
          name: name,
          img: img,
          weight: weight,
          height: height,
          types: types,
        );

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      name: json['name'] as String,
      img: json['sprites']['front_default'] as String,
      weight: json['weight'] as int,
      height: json['height'] as int,
      types: json['types']
          .map((type) => type['type']['name'] as dynamic)
          .toList() as List<dynamic>,
    );
  }
}
