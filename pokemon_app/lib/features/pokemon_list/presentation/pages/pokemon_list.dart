import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/pokemon.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/card.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/pagination.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPage();
}

class _PokemonListPage extends State<PokemonListPage> {
  @override
  void initState() {
    BlocProvider.of<PokemonListBloc>(context).add(PokemonListLoadEvent(true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Pokemon App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: PaginationWidget<PokemonModel>(
        child: (PokemonModel pokemonModel) {
          return PokemonCard(pokemon: pokemonModel);
        },
      ),
    );
  }
}
