import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/presentation/list/model/pokemon_list_states.dart';
import 'package:flutter_pokedex/presentation/list/pokemon_list_bloc.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListStates>(builder: (context, state) {
      if (state is InitialState) {
        return Container();
      }
      if (state is UpdateState) {
        print("Update state");
        return ListView.builder(
          padding: EdgeInsets.all(8),
            itemCount: state.pokemons.length,
            itemBuilder: ((context, index) {
              return PokemonItem(name: state.pokemons[index].name);
            }));
      } else {
        return Container();
      }
    });
  }
}

class PokemonItem extends StatelessWidget {
  final String name;

  const PokemonItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Clicked"),
      child: Card(
        color: Color.fromARGB(255, 14, 236, 143),
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/35.png',
              height: 60,
            ),
            Spacer(),
            Text(
              this.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class PokemonListTitle extends StatelessWidget {
  const PokemonListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pokemon List",
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    );
  }
}
