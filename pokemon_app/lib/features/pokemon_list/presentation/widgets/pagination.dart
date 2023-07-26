import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/pokemon.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';

class PaginationWidget<t> extends StatelessWidget {
  final Function() loadMore;
  final Widget initialError;
  final Widget initialLoading;
  final Widget initialEmpty;
  final Widget Function(t p) child;
  final Widget? onLoadMoreError;
  final Widget? onLoadMoreLoading;
  const PaginationWidget(
      {Key? key,
      required this.loadMore,
      required this.initialError,
      required this.initialLoading,
      required this.initialEmpty,
      this.onLoadMoreError,
      this.onLoadMoreLoading,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      builder: (context, state) {
        if (state is PokemonListLoaded) {
          List<PokemonModel>? pokemonList = state.pokemonList.pokemonList;
          return NotificationListener<ScrollEndNotification>(
              onNotification: (scrollInfo) {
                scrollInfo.metrics.pixels >
                            scrollInfo.metrics.maxScrollExtent - 20 &&
                        !(state.pokemonList.next == null)
                    ? loadMore()
                    : null;
                return true;
              },
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: pokemonList?.length,
                          itemBuilder: (context, index) =>
                              child(pokemonList?[index] as t))),
                  if (state.error != null)
                    Expanded(child: onLoadMoreError ?? initialError),
                  if (state.loading != null)
                    Expanded(child: onLoadMoreLoading ?? initialLoading),
                ],
              ));
        }
        if (state is PokemonListInitialLoading) {
          return initialLoading;
        }
        if (state is PokemonListEmpty) {
          return initialEmpty;
        }
        if (state is PokemonListInitialError) {
          return initialError;
        }
        return const SizedBox.shrink();
      },
    );
  }
}
