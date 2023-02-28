import 'dart:ffi';

import 'package:poke_api/old/network_request.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Pokes {
  final String id;
  final String name;
  final String url;

  const Pokes({required this.id, required this.name, required this.url});

  factory Pokes.fromJson(Map<String, dynamic> json) {
    return Pokes(
      id: uuid.v1(),
      name: json['name'] as String,
      url: json['url'] as String,
    );
    // photo: Photo.fromJson(json['photo']));
  }
}

class Photo {
  final String photoPath;

  Photo({required this.photoPath});
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(photoPath: json['front_default']);
  }
}
