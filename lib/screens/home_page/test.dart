import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_with_bloc/data/repositories/pokedex_repositories.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_with_bloc/utils/extensions/palette_generator.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Color _color = Colors.white;
  @override
  void initState() {
    super.initState();
    _getColor();
  }

  void _getColor() async {
    var palette = await PaletteGenerator.fromImageProvider(NetworkImage(
        "https://raw.githubusercontent.com/TheArtificial/pokemon-icons/master/_icons/PNG/1x/025-pikachu.png"));
    setState(() {
      _color = palette.dominantColor!.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: _color,
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
