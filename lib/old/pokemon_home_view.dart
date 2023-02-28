// import 'package:flutter/material.dart';

// import 'package:poke_api/old/network_request.dart';
// import 'package:poke_api/old/poke.dart';
// import 'package:http/http.dart' as http;

// class PokemonHomePage extends StatelessWidget {
//   const PokemonHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Pokes>>(
//         future: fetchPokes(http.Client()),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           } else if (snapshot.hasData) {
//             return PokesList(
//               pokes: snapshot.data!,
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class PokesList extends StatelessWidget {
//   const PokesList({super.key, required this.pokes});
//   final List<Pokes> pokes;
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate:
//           const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemCount: pokes.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             Text(pokes[index].name),
//             PhotoView(
//               name: pokes[index].name,
//             )
//           ],
//         );
//       },
//     );
//   }
// }

// // class PhotoView extends StatelessWidget {
// //   const PhotoView({super.key, required this.name});
// //   final String name;
// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder<Photo>(
// //       future: fetchPhoto(http.Client(), name),
// //       builder: (context, snapshot) {
// //         if (snapshot.hasError) {
// //           return Center(
// //             child: Text(snapshot.error.toString()),
// //           );
// //         } else if (snapshot.hasData) {
// //           return Photos(
// //             photo: snapshot.data!,
// //           );
// //         } else {
// //           return const Center(
// //             child: CircularProgressIndicator(),
// //           );
// //         }
// //       },
// //     );
// //   }
// // }

// class Photos extends StatelessWidget {
//   const Photos({super.key, required this.photo});
//   final Photo photo;

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       photo.photoPath,
//     );
//   }
// }
