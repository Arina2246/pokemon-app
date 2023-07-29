import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/pokemon.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/empty.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/error.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/loading.dart';

class PaginationWidget<t> extends StatefulWidget {
  final Widget Function(PokemonModel p) child;

  const PaginationWidget({
    super.key,
    required this.child,
  });

  @override
  State<PaginationWidget> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  late ScrollController _controller;
  bool _isLoadMoreRunning = false;

  void _loadData() async {
    if (_controller.position.extentAfter < 1 && _isLoadMoreRunning == false) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      BlocProvider.of<PokemonListBloc>(context)
          .add(PokemonListLoadEvent(false));
    }
    setState(() {
      _isLoadMoreRunning = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_loadData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      builder: (context, state) {
        if (state is PokemonListLoaded) {
          List<PokemonModel>? pokemonList = state.pokemonList.pokemonList;
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      controller: _controller,
                      itemCount: pokemonList!.length,
                      itemBuilder: (context, index) =>
                          widget.child(pokemonList[index]))),
              if (state.error != null)
                const Expanded(child: CustomErrorWidget()),
              if (state.loading != null) const Expanded(child: LoadingWidget()),
            ],
          );
        }
        if (_isLoadMoreRunning) {
          return const LoadingWidget();
        }
        if (state is PokemonListInitial) {
          return const LoadingWidget();
        }
        if (state is PokemonListInitialLoading) {
          return const LoadingWidget();
        }
        if (state is PokemonListEmpty) {
          return const EmptyWidget();
        }
        if (state is PokemonListInitialError) {
          return const CustomErrorWidget();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
