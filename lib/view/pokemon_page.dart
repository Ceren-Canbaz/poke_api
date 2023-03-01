import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_api/bloc/pokemon_bloc.dart';
import 'package:poke_api/bloc/pokemon_event.dart';
import 'package:poke_api/bloc/pokemon_state.dart';
import 'package:poke_api/model/pokemon_model.dart';
import 'package:poke_api/repository/repositories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(
            create: (BuildContext context) =>
                PokemonBloc(PokemonRepository())..add(LoadPokemonEvent()),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pokemon Home Page'),
          ),
          body: Builder(builder: (context) {
            return Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                // ignore: prefer_const_constructors
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.amber)),
                        labelText: 'Search',
                      ),
                      onChanged: (text) {
                        context.read<PokemonBloc>().add(SearchEvent(text));
                      },
                    ),
                  ),
                ),
                const Expanded(
                  flex: 9,
                  child: blocBody(),
                )
              ],
            );
          }),
        ));
  }
}

class blocBody extends StatelessWidget {
  const blocBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      if (state is PokemonLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is PokemonloadedState) {
        List<Pokemon> pokemonList = state.searchText.isEmpty
            ? state.pokemons
            : state.pokemons
                .where((element) =>
                    element.name.contains(state.searchText.toLowerCase()))
                .toList();

        return ListView.builder(
          itemCount: pokemonList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Card(
                color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.network(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonList[index].url}.png'),
                      ),
                      title: Text(
                        pokemonList[index].name.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 24),
                      ),
                    ),
                    Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonList[index].url}.png'),
                    ElevatedButton(
                        onPressed: () => context.goNamed("details",
                            params: {'name': pokemonList[index].name}),
                        child: const Text('Go to details page')),
                  ],
                ),
              ),
            );
          },
        );
      }
      if (state is PokemonErrorState) {
        return const Center(
          child: Text("Error"),
        );
      }

      return Container();
    });
  }
}
// Widget blocBody() {
//   return Builder(builder: (context) {
//     return BlocProvider(
//       create: (context) =>
//           PokemonBloc(PokemonRepository())..add(LoadPokemonEvent()),
//       child: BlocBuilder(builder: (context, state) {
//         if (state is PokemonLoadingState) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is PokemonloadedState) {
//           List<PokemonModel> pokemonList = state.pokemons;
//           return ListView.builder(
//             itemCount: pokemonList.length,
//             itemBuilder: (_, index) {
//               return Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                 child: Card(
//                   color: Colors.amber,
//                   child: ListTile(
//                     title: Text(pokemonList[index].name),
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//         if (state is PokemonErrorState) {
//           return const Center(
//             child: Text("Error"),
//           );
//         }

//         return Container();
//       }),
//     );
//   });
// }
