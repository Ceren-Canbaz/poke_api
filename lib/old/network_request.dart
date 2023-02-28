import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api/old/poke.dart';

// Future<http.Response> fetchPokes(http.Client client) async {
//   return client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));
// }

List<Pokes> parsePokes(String responseBody) {
  final parsed = jsonDecode(responseBody)['results'];

  return parsed.map<Pokes>((json) => Pokes.fromJson(json)).toList();
}

Future<List<Pokes>> fetchPokes(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));
  return compute(parsePokes, response.body);
}

// Future<Photo> fetchPhoto(http.Client client, String name) async {
//   final response =
//       await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
//   return compute(parsePhoto, response.body);
// }

// Photo parsePhoto(String responseBody) {
//   final parsed =
//       jsonDecode(responseBody)['sprites']['other']['official-artwork'];
//   // return parsed.map<Photo>((json) => Photo.fromJson(json));

//   return Photo.fromJson(parsed);
// }
