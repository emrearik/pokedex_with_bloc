import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokedexImage {
  PokedexImage._();

  static SvgPicture toImage(String id, String name) {
    String newId = id.toString().padLeft(3, '0');
    String newName = name.toLowerCase();
    return SvgPicture.asset(
      'assets/images/pokemon_images/$newId-$newName.svg',
      width: 50,
      height: 80,
    );
  }
}
