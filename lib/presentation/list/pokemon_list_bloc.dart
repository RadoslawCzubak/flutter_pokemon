import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/core/data/response.dart';
import 'package:flutter_pokedex/data/models/pokemon_remote.dart';
import 'package:flutter_pokedex/data/models/pokemons_response.dart';
import 'package:flutter_pokedex/data/poke_api.dart';
import 'package:flutter_pokedex/presentation/list/model/pokemon_list_events.dart';
import 'package:flutter_pokedex/presentation/list/model/pokemon_list_states.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListStates>{
  List<PokemonListItemRemote> pokemons = List.empty();
  
  PokemonListBloc() : super(InitialState()) {
    on<GetPokemons>(onGetPokemons);
  }

  FutureOr<void> onGetPokemons(
    GetPokemons event, Emitter<PokemonListStates> emit
  ) async {
    NetworkResponse<PokemonResponse> pokemonNetworkResponse = await fetchPokemons();
    PokemonResponse pokemonsResponse = pokemonNetworkResponse.body;
    pokemons = pokemonsResponse.results;
    print("Got pokemons");
    emit(UpdateState(pokemons));
  }
}