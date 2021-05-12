import 'dart:io';

import 'package:artemis/artemis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql/client.dart';

import 'graphql/fetch_pokemons_query.graphql.dart';

void main(List<String> args) async {
  final artemisClient = ArtemisClient('https://graphql-pokemon2.vercel.app/');
  final graphQLClient = GraphQLClient(
      link: HttpLink('https://graphql-pokemon2.vercel.app/'),
      cache: GraphQLCache());
  runApp(Home(
    artemisClient: artemisClient,
  ));
}

class Home extends StatelessWidget {
  final ArtemisClient artemisClient;

  const Home({Key? key, required this.artemisClient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
        ),
        body: FutureBuilder(
            future: _fetchArtemisClient(artemisClient),
            builder: (BuildContext context,
                AsyncSnapshot<FetchPokemons$Query> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.data != null) {
                final pokemons = snapshot.data!.pokemons;
                return ListView.builder(
                    itemCount: pokemons!.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemons[index]!;
                      return ExpansionTile(
                        trailing: Icon(Icons.arrow_drop_down_sharp),
                        title: Text(pokemon.name ?? 'pokemon name'),
                        subtitle: Text(
                            pokemon.classification ?? 'pokemon classification'),
                        leading: Image.network(pokemon.image!),
                        children: [
                          ListTile(
                            title: Text('Max HP'),
                            subtitle: Text(pokemon.maxHP.toString()),
                          ),
                          ListTile(
                            title: Text('Max CP'),
                            subtitle: Text(pokemon.maxCP.toString()),
                          ),
                        ],
                      );
                    });
              }
              return Center(
                child: Text('Error fetching data'),
              );
            }),
      ),
    );
  }
}

Future<FetchPokemons$Query> _fetchArtemisClient(ArtemisClient client) async {
  final pokemonsQuery =
      FetchPokemonsQuery(variables: FetchPokemonsArguments(quantity: 15));
  final result = await client.execute(pokemonsQuery);
  if (result.hasErrors) {
    throw Exception(result.errors);
  }
  return result.data!;
}

Future<FetchPokemons$Query> _fetchGraphQLClient(GraphQLClient client) async {
  final pokemonsQuery =
      FetchPokemonsQuery(variables: FetchPokemonsArguments(quantity: 20));
  final queryOptions = QueryOptions(
      document: pokemonsQuery.document,
      variables: pokemonsQuery.variables.toJson(),
      fetchPolicy: FetchPolicy.cacheAndNetwork);
  final result = await client.query(queryOptions);
  if (result.hasException) {
    throw result.exception!;
  }
  return FetchPokemons$Query.fromJson(result.data!);
}
