import 'package:flutter/material.dart';
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

  const PokedexCompleted(this.pokedexList);
}

class PokedexError extends PokedexState {
  const PokedexError();
}
