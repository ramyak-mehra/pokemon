// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'fetch_pokemons_query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class FetchPokemons$Query$Pokemon extends JsonSerializable with EquatableMixin {
  FetchPokemons$Query$Pokemon();

  factory FetchPokemons$Query$Pokemon.fromJson(Map<String, dynamic> json) =>
      _$FetchPokemons$Query$PokemonFromJson(json);

  late String id;

  String? name;

  String? image;

  String? classification;

  List<String?>? types;

  int? maxCP;

  int? maxHP;

  @override
  List<Object?> get props =>
      [id, name, image, classification, types, maxCP, maxHP];
  Map<String, dynamic> toJson() => _$FetchPokemons$Query$PokemonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchPokemons$Query extends JsonSerializable with EquatableMixin {
  FetchPokemons$Query();

  factory FetchPokemons$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchPokemons$QueryFromJson(json);

  List<FetchPokemons$Query$Pokemon?>? pokemons;

  @override
  List<Object?> get props => [pokemons];
  Map<String, dynamic> toJson() => _$FetchPokemons$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchPokemonsArguments extends JsonSerializable with EquatableMixin {
  FetchPokemonsArguments({required this.quantity});

  @override
  factory FetchPokemonsArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchPokemonsArgumentsFromJson(json);

  late int quantity;

  @override
  List<Object?> get props => [quantity];
  @override
  Map<String, dynamic> toJson() => _$FetchPokemonsArgumentsToJson(this);
}

final FETCH_POKEMONS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'fetch_pokemons'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'quantity')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'pokemons'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'first'),
                  value: VariableNode(name: NameNode(value: 'quantity')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'image'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'classification'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'types'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'maxCP'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'maxHP'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class FetchPokemonsQuery
    extends GraphQLQuery<FetchPokemons$Query, FetchPokemonsArguments> {
  FetchPokemonsQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_POKEMONS_QUERY_DOCUMENT;

  @override
  final String operationName = 'fetch_pokemons';

  @override
  final FetchPokemonsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchPokemons$Query parse(Map<String, dynamic> json) =>
      FetchPokemons$Query.fromJson(json);
}
