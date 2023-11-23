import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start pokemon Group Code

class PokemonGroup {
  static String baseUrl = 'https://pokeapi.co/api/v2';
  static Map<String, String> headers = {};
  static PokemonListCall pokemonListCall = PokemonListCall();
  static PokemonDetailsCall pokemonDetailsCall = PokemonDetailsCall();
}

class PokemonListCall {
  Future<ApiCallResponse> call({
    int? limit = 20,
    int? offset = 20,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Pokemon List',
      apiUrl: '${PokemonGroup.baseUrl}/pokemon',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic next(dynamic response) => getJsonField(
        response,
        r'''$.next''',
      );
  dynamic results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
  dynamic resultsName(dynamic response) => getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      );
  dynamic resultsUrl(dynamic response) => getJsonField(
        response,
        r'''$.results[:].url''',
        true,
      );
}

class PokemonDetailsCall {
  Future<ApiCallResponse> call({
    String? name = 'pikachu',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Pokemon Details',
      apiUrl: '${PokemonGroup.baseUrl}/pokemon/${name}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic abilities(dynamic response) => getJsonField(
        response,
        r'''$.abilities''',
        true,
      );
  dynamic baseExperience(dynamic response) => getJsonField(
        response,
        r'''$.base_experience''',
      );
  dynamic forms(dynamic response) => getJsonField(
        response,
        r'''$.forms''',
        true,
      );
  dynamic height(dynamic response) => getJsonField(
        response,
        r'''$.height''',
      );
  dynamic heldItem(dynamic response) => getJsonField(
        response,
        r'''$.held_items''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic moves(dynamic response) => getJsonField(
        response,
        r'''$.moves''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic order(dynamic response) => getJsonField(
        response,
        r'''$.order''',
      );
  dynamic pastAbilities(dynamic response) => getJsonField(
        response,
        r'''$.past_abilities''',
        true,
      );
  dynamic pastTypes(dynamic response) => getJsonField(
        response,
        r'''$.past_types''',
        true,
      );
  dynamic species(dynamic response) => getJsonField(
        response,
        r'''$.species''',
      );
  dynamic types(dynamic response) => getJsonField(
        response,
        r'''$.types''',
        true,
      );
  dynamic weight(dynamic response) => getJsonField(
        response,
        r'''$.weight''',
      );
  dynamic form(dynamic response) => getJsonField(
        response,
        r'''$.forms[:].url''',
      );
  dynamic firstType(dynamic response) => getJsonField(
        response,
        r'''$.types[:].type.name''',
      );
  dynamic firstSprite(dynamic response) => getJsonField(
        response,
        r'''$.sprites.front_default''',
      );
  dynamic backSprite(dynamic response) => getJsonField(
        response,
        r'''$.sprites.back_default''',
      );
  dynamic femaleSprite(dynamic response) => getJsonField(
        response,
        r'''$.sprites.front_female''',
      );
  dynamic femaleBackSprite(dynamic response) => getJsonField(
        response,
        r'''$.sprites.back_female''',
      );
  dynamic abilitiesName(dynamic response) => getJsonField(
        response,
        r'''$.abilities[:].ability.name''',
        true,
      );
  dynamic heldItemName(dynamic response) => getJsonField(
        response,
        r'''$.held_items[:].item.name''',
        true,
      );
  dynamic moveName(dynamic response) => getJsonField(
        response,
        r'''$.moves[:].move.name''',
        true,
      );
  dynamic baseStatValue(dynamic response) => getJsonField(
        response,
        r'''$.stats[:].base_stat''',
        true,
      );
  dynamic baseStatName(dynamic response) => getJsonField(
        response,
        r'''$.stats[:].stat.name''',
        true,
      );
}

/// End pokemon Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
