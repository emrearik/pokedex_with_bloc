import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_with_bloc/business_logic/state/pokedex_state.dart';
import 'package:pokedex_with_bloc/data/repositories/pokedex_repositories.dart';

class PokedexCubit extends Cubit<PokedexState> {
  final PokedexRepositories _pokedexRepositories;
  PokedexCubit(this._pokedexRepositories) : super(PokedexInitial());

  Future<void> getPokemonList() async {
    try {
      emit(PokedexLoading());
      final response = await _pokedexRepositories.getPokedexList();
      final String test = "test";
      emit(PokedexCompleted(response, test));
    } catch (e) {
      emit(PokedexError());
    }
  }
}
