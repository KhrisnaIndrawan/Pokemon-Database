import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pokemon_list_widget.dart' show PokemonListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PokemonListModel extends FlutterFlowModel<PokemonListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for list widget.

  PagingController<ApiPagingParams, dynamic>? listPagingController;
  Function(ApiPagingParams nextPageMarker)? listApiCall;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    listPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setListController(
    Function(ApiPagingParams) apiCall,
  ) {
    listApiCall = apiCall;
    return listPagingController ??= _createListController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listPokemonListPage);
  }

  void listPokemonListPage(ApiPagingParams nextPageMarker) =>
      listApiCall!(nextPageMarker).then((listPokemonListResponse) {
        final pageItems = (PokemonGroup.pokemonListCall
                    .results(
                      listPokemonListResponse.jsonBody,
                    )!
                    .map((e) => e)
                    .toList() ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listPokemonListResponse,
                )
              : null,
        );
      });
}
