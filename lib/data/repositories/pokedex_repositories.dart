import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:pokedex_with_bloc/data/models/pokedex_model.dart';
import 'package:http/http.dart' as http;

abstract class BasePokedexRepositories {
  Future<List<PokedexModel>> getPokedexList();
}

class PokedexRepositories implements BasePokedexRepositories {
  final baseUrl = Uri.parse(
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/pokedex.json');

  @override
  Future<List<PokedexModel>> getPokedexList() async {
    try {
      final response = await http.get(baseUrl);
      switch (response.statusCode) {
        case HttpStatus.ok:
          List jsonResponse = jsonDecode(response.body);
          return jsonResponse.map((e) => PokedexModel.fromJson(e)).toList();

        default:
          throw Exception();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
