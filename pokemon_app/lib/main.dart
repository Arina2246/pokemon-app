import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/pages/pokemon_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PokemonListBloc())],
        child: MaterialApp(
          title: 'Pagination Example with Flutter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: const PokemonListPage(),
        ));
  }
}

//todo: impl usecases db, impl pagination, impl markup,
