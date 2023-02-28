import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:poke_api/model/pokemon_model.dart';
import 'package:poke_api/old/poke.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonLoadingState extends PokemonState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PokemonloadedState extends PokemonState {
  final List<PokemonModel> pokemons;
  final String searchText;
  PokemonloadedState(this.pokemons, this.searchText);
  PokemonloadedState copyWith(
      {List<PokemonModel>? pokemons, String? searchText}) {
    return PokemonloadedState(
        pokemons ?? this.pokemons, searchText ?? this.searchText);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [pokemons, searchText];
}

class PokemonErrorState extends PokemonState {
  final String error;

  PokemonErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
