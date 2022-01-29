import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';

import 'package:pokedex_with_bloc/data/models/pokedex_model.dart';

abstract class BasePokedexRepositories {
  Future<List<PokedexModel>> getPokedexList();
  Future<Color> getPokedexColor(PokedexModel poke);
}

class PokedexRepositories implements BasePokedexRepositories {
  final baseUrl = Uri.parse(
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/pokedex.json');
  int _currentMax = 0;
  List<PokedexModel> pokedexList = [];

  @override
  Future<List<PokedexModel>> getPokedexList() async {
    try {
      final response = await http.get(baseUrl);
      switch (response.statusCode) {
        case HttpStatus.ok:
          List jsonResponse = jsonDecode(response.body);
          for (int i = _currentMax; i < _currentMax + 8; i++) {
            PokedexModel poke = PokedexModel.fromJson(jsonResponse[i]);
            poke.color = await getPokedexColor(poke);
            pokedexList.add(poke);
          }
          _currentMax = _currentMax + 8;
          return pokedexList;
        default:
          throw Exception();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<Color> getPokedexColor(PokedexModel poke) async {
    String newId = poke.id.toString().padLeft(3, '0');
    String newName = poke.name!.english!.toLowerCase();
    String allName = newId + "-" + newName;

    if (allName == "029-nidoran♀") {
      allName = "029-nidoran-f";
    } else if (allName == "032-nidoran♂") {
      allName = "032-nidoran-m";
    } else if (allName == "083-farfetch'd") {
      allName = "083-farfetchd";
    }

    var palette = await PaletteGenerator.fromImageProvider(NetworkImage(
        "https://raw.githubusercontent.com/TheArtificial/pokemon-icons/master/_icons/PNG/1x/$allName.png"));

    return (palette.dominantColor!.color);
  }
}
