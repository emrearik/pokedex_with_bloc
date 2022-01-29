import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_with_bloc/business_logic/cubit/pokedex_cubit.dart';
import 'package:pokedex_with_bloc/business_logic/state/pokedex_state.dart';
import 'package:pokedex_with_bloc/data/repositories/pokedex_repositories.dart';
import 'package:pokedex_with_bloc/screens/home_page/widget/pokemon_show_widget.dart';
import 'package:pokedex_with_bloc/utils/extensions/pokemon_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PokedexCubit>().getPokemonList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: buildBlocConsumer()),
    );
  }

  BlocConsumer<PokedexCubit, PokedexState> buildBlocConsumer() {
    return BlocConsumer<PokedexCubit, PokedexState>(
      listener: (context, state) {
        if (state is PokedexError) {
          print(state.toString());
        }
      },
      builder: (context, state) {
        if (state is PokedexInitial) {
          return buildPokedexInitial();
        } else if (state is PokedexLoading) {
          return buildPokedexLoading();
        } else if (state is PokedexCompleted) {
          return buildPokedexCompleted(state);
        } else {
          return buildPokedexError();
        }
      },
    );
  }

  Widget buildPokedexInitial() {
    return Center(
      child: Text("Pokedex listesi yükleniyor..."),
    );
  }

  Widget buildPokedexLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildPokedexCompleted(PokedexCompleted state) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Pokedex",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 100,
                itemBuilder: (context, index) {
                  return PokemonShow(
                    pokemonID: state.pokedexList[index].id.toString(),
                    pokemonName:
                        state.pokedexList[index].name!.english.toString(),
                    state: state,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPokedexError() {
    return Center(
      child: Text("Bir hata oluştu"),
    );
  }
}
