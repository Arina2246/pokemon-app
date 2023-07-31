// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonListLocalAdapter extends TypeAdapter<PokemonListLocal> {
  @override
  final int typeId = 0;

  @override
  PokemonListLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonListLocal(
      pokemonList: (fields[0] as List).cast<PokemonLocal>(),
      next: fields[1] as String,
      count: fields[2] as int,
      previous: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonListLocal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.pokemonList)
      ..writeByte(1)
      ..write(obj.next)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.previous);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonListLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
