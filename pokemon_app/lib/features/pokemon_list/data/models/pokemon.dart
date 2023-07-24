import 'package:equatable/equatable.dart';

class PokemonModel extends Equatable {
  final String? name;
  final String? url;

  const PokemonModel({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];

  factory PokemonModel.fromJson(Map<String, String> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }
}
