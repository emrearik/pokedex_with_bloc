import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_with_bloc/business_logic/state/pokedex_state.dart';

class PokemonShow extends StatefulWidget {
  final String pokemonID;
  final String pokemonName;
  final PokedexCompleted state;

  const PokemonShow(
      {Key? key,
      required this.pokemonID,
      required this.pokemonName,
      required this.state})
      : super(key: key);

  @override
  State<PokemonShow> createState() => _PokemonShowState();
}

class _PokemonShowState extends State<PokemonShow> {
  Color _color = Colors.white;
  @override
  void initState() {
    super.initState();
    _getColor();
  }

  String pokemonPhoto() {
    String newId = widget.pokemonID.toString().padLeft(3, '0');
    String newName = widget.pokemonName.toLowerCase();
    return newId + "-" + newName;
  }

  void _getColor() async {
    String pokemonPhotoName = pokemonPhoto();
    print(pokemonPhotoName);
    var palette = await PaletteGenerator.fromImageProvider(NetworkImage(
        "https://raw.githubusercontent.com/TheArtificial/pokemon-icons/master/_icons/PNG/1x/$pokemonPhotoName.png"));
    setState(() {
      _color = palette.dominantColor!.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Card(
        child: Text("Test"),
        color: _color,
      ),
    );
  }
}
