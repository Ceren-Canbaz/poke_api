// ignore_for_file: public_member_api_docs, sort_constructors_first
// class PokemonModel {
//   final String name;
//   final String url;

//   PokemonModel(
//     this.name,
//     this.url,
//   );

//   PokemonModel.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }
//   PokemonModel.fromJsonForPhoto(
//       {required String photoUrl, required String pokeName}) {
//     url = photoUrl;
//     name = pokeName;
//   }
// }

class Pokemon {
  final String name;
  String url;

  Pokemon(this.name, this.url);

  Pokemon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];
}

class PokemonBase {
  String lastName;
  String itemNumber;
  PokemonBase(
    this.lastName,
    this.itemNumber,
  );
}

class PhotoModel extends Pokemon {
  PhotoModel.fromJson(super.json) : super.fromJson();
  // late final String url;
  // PhotoModel({
  //   required this.url,
  // });
  // PhotoModel.fromJson(Map<String, dynamic> json) {
  //   url = json['front_default'];
  // }
}
