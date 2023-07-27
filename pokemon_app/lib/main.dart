import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_details/bloc/pokemon_details_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/pages/pokemon_list.dart';

void main() {
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
