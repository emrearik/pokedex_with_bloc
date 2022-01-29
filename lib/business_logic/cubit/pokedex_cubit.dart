import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_with_bloc/business_logic/state/pokedex_state.dart';
import 'package:pokedex_with_bloc/data/repositories/pokedex_repositories.dart';

class PokedexCubit extends Cubit<PokedexState> {
  final PokedexRepositories _pokedexRepositories;
  ScrollController scrollController = ScrollController();
  bool isLoading = true;
  PokedexCubit(this._pokedexRepositories) : super(PokedexLoading());

  init() async {
    await getPokemonList();
    scrollController.addListener(detectScrolledToEnd);
  }

  detectScrolledToEnd() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await getPokemonList();
    }
  }

  Future<void> getPokemonList() async {
    try {
      final response = await _pokedexRepositories.getPokedexList();
      isLoading = false;
      emit(PokedexCompleted(response));
    } catch (e) {
      emit(PokedexError());
    }
  }
}
