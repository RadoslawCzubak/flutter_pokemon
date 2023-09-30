import 'package:flutter_pokedex/data/models/pokemon_remote.dart';

class PokemonResponse {
  final int count;
  final List<PokemonListItemRemote> results;

  const PokemonResponse({
    required this.count,
    required this.results
  });
}