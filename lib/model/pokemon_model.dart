// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonModel {
  late final String name;
  late final String url;

  PokemonModel({
    required this.name,
  });

  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
  PokemonModel.fromJsonForPhoto(String photoUrl) {
    url = photoUrl;
  }
}

class PhotoModel {
  late final String url;
  PhotoModel({
    required this.url,
  });
  PhotoModel.fromJson(Map<String, dynamic> json) {
    url = json['front_default'];
  }
}
