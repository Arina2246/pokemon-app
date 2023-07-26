import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/config/colors/colors.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/pokemon.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/card.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/empty.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/error.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/loading.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/pagination.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPage();
}

class _PokemonListPage extends State<PokemonListPage> {
  @override
  void initState() {
    BlocProvider.of<PokemonListBloc>(context).add(PokemonListLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pokemon App",
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: PaginationWidget<PokemonModel>(
          loadMore: () {
            BlocProvider.of<PokemonListBloc>(context)
                .add(PokemonListLoadEvent());
          },
          initialEmpty: const EmptyWidget(),
          initialLoading: const LoadingWidget(),
          initialError: const CustomErrorWidget(),
          child: (PokemonModel productModel) {
            return PokemonCard(pokemon: productModel);
          },
        ));
  }
}
