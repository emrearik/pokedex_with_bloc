import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokedexImage {
  PokedexImage._();

  static SvgPicture toImage(String id, String name, double height) {
    String newId = id.toString().padLeft(3, '0');
    String newName = name.toLowerCase();
    String fullName = newId + "-" + newName;

    if (fullName == "029-nidoran♀") {
      fullName = "029-nidoran-f";
    } else if (fullName == "032-nidoran♂") {
      fullName = "032-nidoran-m";
    } else if (fullName == "083-farfetch'd") {
      fullName = "083-farfetchd";
    }

    return SvgPicture.asset(
      'assets/images/pokemon_images/$fullName.svg',
      height: height,
    );
  }
}
