import 'package:equatable/equatable.dart';

class PokemonDetailsEntity extends Equatable {
  final String? name;
  final String? img;
  final int? weight;
  final int? height;
  final List<dynamic>? types;

  const PokemonDetailsEntity(
      {required this.name,
      required this.img,
      required this.weight,
      required this.height,
      required this.types});

  @override
  List<Object?> get props => [name, img, weight, height, types];
}
