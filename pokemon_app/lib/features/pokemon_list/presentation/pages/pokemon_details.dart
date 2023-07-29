import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/domain/entities/pokemon_details.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/bloc/pokemon_details/bloc/pokemon_details_bloc.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/error.dart';
import 'package:pokemon_app/features/pokemon_list/presentation/widgets/loading.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String urlPokemon;

  const PokemonDetailsPage({
    super.key,
    required this.urlPokemon,
  });

  @override
  State<PokemonDetailsPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonDetailsPage> {
  @override
  void initState() {
    BlocProvider.of<PokemonDetailsBloc>(context).add(GetUrl(widget.urlPokemon));
    BlocProvider.of<PokemonDetailsBloc>(context).add(PokemonDetailsLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsLoaded) {
          PokemonDetailsEntity pokemonDetails = state.pokemonDetails;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: const BackButton(
                  color: Colors.white,
                ),
                title: const Text(
                  "Pokemon App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Row(children: [
                          Expanded(
                            child: Image(
                                image: NetworkImage(pokemonDetails.img ?? '')),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              pokemonDetails.name ?? '',
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        // height: 100,
                        child: Column(children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Types: ${pokemonDetails.types!.join(", ")}',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Weight: ${pokemonDetails.weight! / 10}kg',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Height: ${pokemonDetails.height! * 10}cm',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ));
        }
        if (state is PokemonDetailsInitial) {
          return const LoadingWidget();
        }
        if (state is PokemonDetailsLoading) {
          return const LoadingWidget();
        }
        if (state is PokemonDetailsError) {
          return const CustomErrorWidget();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
