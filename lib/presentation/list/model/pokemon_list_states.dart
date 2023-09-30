import 'package:flutter_pokedex/data/models/pokemon_remote.dart';

class PokemonListStates {}

class InitialState extends PokemonListStates {}

class UpdateState extends PokemonListStates {
  final List<PokemonListItemRemote> pokemons;
  UpdateState(this.pokemons);
}