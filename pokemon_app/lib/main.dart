import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/local/pokemon.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/local/pokemon_details.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/local/pokemon_list.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_details/pokemon_details_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/pages/pokemon_list.dart';

void main() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(PokemonLocalAdapter())
    ..registerAdapter(PokemonListLocalAdapter())
    ..registerAdapter(PokemonDetailsLocalAdapter());
  await Hive.openBox<PokemonListLocal>('pokemonList');
  await Hive.openBox<PokemonDetailsLocal>('pokemonDetails');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PokemonListBloc()),
          BlocProvider(create: (context) => PokemonDetailsBloc())
        ],
        child: MaterialApp(
          title: 'Pokemon app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: const PokemonListPage(),
        ));
  }
}
