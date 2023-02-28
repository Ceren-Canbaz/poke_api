import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class LoadPokemonEvent extends PokemonEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchEvent extends PokemonEvent {
  final String currentText;

  SearchEvent(this.currentText);
  @override
  // TODO: implement props
  List<Object?> get props => [currentText];
}
