import 'dart:convert';

import 'package:flutter_pokedex/core/data/response.dart';
import 'package:flutter_pokedex/data/models/pokemon_remote.dart';
import 'package:flutter_pokedex/data/models/pokemons_response.dart';
import 'package:http/http.dart' as http;

PokemonResponse parsePokemonsResponse(String response) {
  final parsed = jsonDecode(response);
  final mapped = parsed["results"].map<PokemonListItemRemote>((json) {
    return PokemonListItemRemote.fromJson(json);
  }).toList();
  print(mapped);
  return PokemonResponse(count: mapped.length, results: mapped);
}

Future<NetworkResponse<PokemonResponse>> fetchPokemons() async {
  final response =
      await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));
  return NetworkResponse.fromHttpResponse(
      response, parsePokemonsResponse(response.body));
}
