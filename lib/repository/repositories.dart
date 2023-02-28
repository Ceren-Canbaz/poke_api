import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api/model/pokemon_model.dart';
import 'package:poke_api/old/poke.dart';

class PokemonRepository {
  String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<PokemonModel>> getPokemons() async {
    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      List<PokemonModel> list = result
          .map<PokemonModel>((json) => PokemonModel.fromJson(json))
          .toList();
      return list;
    } else {
      throw Exception(response.reasonPhrase);
    }
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
