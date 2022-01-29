import 'package:pokedex_with_bloc/data/models/pokedex_model.dart';

abstract class PokedexState {
  const PokedexState();
}

class PokedexInitial extends PokedexState {
  const PokedexInitial();
}

class PokedexLoading extends PokedexState {
  const PokedexLoading();
}

class PokedexCompleted extends PokedexState {
  final List<PokedexModel> pokedexList;
  final String test;
  const PokedexCompleted(this.pokedexList, this.test);
}

class PokedexError extends PokedexState {
  const PokedexError();
}
