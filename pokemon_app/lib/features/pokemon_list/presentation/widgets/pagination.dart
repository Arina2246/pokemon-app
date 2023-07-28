import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/data/models/pokemon.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/empty.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/error.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/loading.dart';

class PaginationWidget<t> extends StatelessWidget {
  final Function() loadMore;
  final Widget Function(t p) child;
  const PaginationWidget(
      {Key? key, required this.loadMore, required this.child})
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
                    const Expanded(child: CustomErrorWidget()),
                  if (state.loading != null)
                    const Expanded(child: LoadingWidget()),
                ],
              ));
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
