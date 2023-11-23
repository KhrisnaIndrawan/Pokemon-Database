import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pokemon_list_widget.dart' show PokemonListWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class PokemonListModel extends FlutterFlowModel<PokemonListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for list widget.

  PagingController<ApiPagingParams, dynamic>? listPagingController;
  Function(ApiPagingParams nextPageMarker)? listApiCall;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

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
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listPokemonListResponse,
                )
              : null,
        );
      });
}
