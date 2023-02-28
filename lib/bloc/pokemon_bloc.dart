import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api/bloc/pokemon_event.dart';
import 'package:poke_api/bloc/pokemon_state.dart';
import 'package:poke_api/repository/repositories.dart';
import 'package:http/http.dart' as http;

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;
  PokemonBloc(this._pokemonRepository) : super(PokemonLoadingState()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(PokemonLoadingState());
      try {
        final pokemons = await _pokemonRepository.getPokemons();

        for (var i = 0; i < pokemons.length; i++) {
          final photos = await _pokemonRepository.fetchPhoto(http.Client(),
              name: pokemons[i].name);
          pokemons[i].url = photos.url;
        }

        emit(PokemonloadedState(pokemons, ''));
      } catch (e) {
        emit(PokemonErrorState(e.toString()));
      }
    });
    on<SearchEvent>(
      (event, emit) {
        if (state is PokemonloadedState) {
          final currentState = state as PokemonloadedState;
          emit(currentState.copyWith(searchText: event.currentText));
        }
      },
    );
  }
}
