import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api/model/pokemon_model.dart';

class PokemonRepository {
  String baseUrl = 'https://pokeapi.co/api/v2/pokemon';
  List idArr = [];
  Future<List<Pokemon>> getPokemons() async {
    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      List<Pokemon> list =
          result.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
      splitUrlforId(list);
      return list;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  void splitUrlforId(List<Pokemon> list) {
    list.forEach((element) {
      idArr = element.url.split('/');
      element.url = idArr[idArr.length - 2];
    });
  }

  Future<PhotoModel> fetchPhoto(http.Client client,
      {required String name}) async {
    final response =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    return compute(parsePhoto, response.body);
  }

  PhotoModel parsePhoto(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['sprites']['other']['official-artwork'];
    // return parsed.map<Photo>((json) => Photo.fromJson(json));

    return PhotoModel.fromJson(parsed);
  }
}
