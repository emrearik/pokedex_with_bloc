import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';

class DominantColor {
  DominantColor._();

  static generateDominantColor(String image) {
    var color =
        PaletteGenerator.fromImageProvider(AssetImage(image)).then((generator) {
      Color color = generator.mutedColor!.color;
      return color;
    });
  }
}
