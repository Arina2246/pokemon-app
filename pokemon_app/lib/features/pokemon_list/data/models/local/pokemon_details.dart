import 'package:hive/hive.dart';
part 'pokemon_details.g.dart';

@HiveType(typeId: 2)
class PokemonDetailsLocal {
  @HiveField(0)
  String name;

  @HiveField(1)
  String img;

  @HiveField(2)
  int weight;

  @HiveField(3)
  int height;

  @HiveField(4)
  List<dynamic> types;

  PokemonDetailsLocal({
    required this.name,
    required this.img,
    required this.weight,
    required this.height,
    required this.types,
  });
}
