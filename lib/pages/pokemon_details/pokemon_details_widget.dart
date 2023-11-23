import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pokemon_details_model.dart';
export 'pokemon_details_model.dart';

class PokemonDetailsWidget extends StatefulWidget {
  const PokemonDetailsWidget({
    super.key,
    this.name,
  });

  final String? name;

  @override
  _PokemonDetailsWidgetState createState() => _PokemonDetailsWidgetState();
}

class _PokemonDetailsWidgetState extends State<PokemonDetailsWidget> {
  late PokemonDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PokemonDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return FutureBuilder<ApiCallResponse>(
      future: PokemonGroup.pokemonDetailsCall.call(
        name: widget.name,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).background,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCubeGrid(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final pokemonDetailsPokemonDetailsResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).background,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 54.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Pokemon Details',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          PokemonGroup.pokemonDetailsCall
                              .firstType(
                                pokemonDetailsPokemonDetailsResponse.jsonBody,
                              )
                              .toString(),
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          PokemonGroup.pokemonDetailsCall
                              .name(
                                pokemonDetailsPokemonDetailsResponse.jsonBody,
                              )
                              .toString(),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).dark400,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 180.0,
                      child: CarouselSlider(
                        items: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              PokemonGroup.pokemonDetailsCall.firstSprite(
                                pokemonDetailsPokemonDetailsResponse.jsonBody,
                              ),
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              PokemonGroup.pokemonDetailsCall.backSprite(
                                pokemonDetailsPokemonDetailsResponse.jsonBody,
                              ),
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              PokemonGroup.pokemonDetailsCall.femaleSprite(
                                pokemonDetailsPokemonDetailsResponse.jsonBody,
                              ),
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              PokemonGroup.pokemonDetailsCall.femaleBackSprite(
                                pokemonDetailsPokemonDetailsResponse.jsonBody,
                              ),
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                        carouselController: _model.carouselController ??=
                            CarouselController(),
                        options: CarouselOptions(
                          initialPage: 1,
                          viewportFraction: 0.5,
                          disableCenter: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.25,
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: false,
                          onPageChanged: (index, _) =>
                              _model.carouselCurrentIndex = index,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Base Exp',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                            Text(
                              PokemonGroup.pokemonDetailsCall
                                  .baseExperience(
                                    pokemonDetailsPokemonDetailsResponse
                                        .jsonBody,
                                  )
                                  .toString(),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Height',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                PokemonGroup.pokemonDetailsCall
                                    .height(
                                      pokemonDetailsPokemonDetailsResponse
                                          .jsonBody,
                                    )
                                    .toString(),
                                '20',
                              ),
                              style: FlutterFlowTheme.of(context).displaySmall,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'Weight',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                PokemonGroup.pokemonDetailsCall
                                    .weight(
                                      pokemonDetailsPokemonDetailsResponse
                                          .jsonBody,
                                    )
                                    .toString(),
                                '20',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: const Color(0x9A090F13),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x43000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.favorite_border,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Love this pokemon?',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: const Color(0xB3FFFFFF),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Add me to your favorite list! ^^',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x37000000),
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.bolt,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 44.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'Ability',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 0.0),
                                  child: Text(
                                    (PokemonGroup.pokemonDetailsCall
                                            .abilitiesName(
                                      pokemonDetailsPokemonDetailsResponse
                                          .jsonBody,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()
                                        .first
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Lexend Deca',
                                      color: const Color(0xB3FFFFFF),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x39000000),
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.handyman_sharp,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 44.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'Held Item',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 0.0),
                                  child: Text(
                                    (PokemonGroup.pokemonDetailsCall
                                            .heldItemName(
                                      pokemonDetailsPokemonDetailsResponse
                                          .jsonBody,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()
                                        .first
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Lexend Deca',
                                      color: const Color(0xB3FFFFFF),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).success,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x37000000),
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.double_arrow,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 44.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'Move',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 0.0),
                                  child: Text(
                                    (PokemonGroup.pokemonDetailsCall.moveName(
                                      pokemonDetailsPokemonDetailsResponse
                                          .jsonBody,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()
                                        .first
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Lexend Deca',
                                      color: const Color(0xB3FFFFFF),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).info,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x39000000),
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'Base Stat',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              'HP',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                'Lexend Deca',
                                                color: const Color(0xB3FFFFFF),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              (PokemonGroup.pokemonDetailsCall
                                                      .baseStatValue(
                                                pokemonDetailsPokemonDetailsResponse
                                                    .jsonBody,
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()[0]
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                'Lexend Deca',
                                                color: const Color(0xB3FFFFFF),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              'Attack',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                'Lexend Deca',
                                                color: const Color(0xB3FFFFFF),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              (PokemonGroup.pokemonDetailsCall
                                                      .baseStatValue(
                                                pokemonDetailsPokemonDetailsResponse
                                                    .jsonBody,
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()[1]
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                'Lexend Deca',
                                                color: const Color(0xB3FFFFFF),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              'Defense',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                'Lexend Deca',
                                                color: const Color(0xB3FFFFFF),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              (PokemonGroup.pokemonDetailsCall
                                                      .baseStatValue(
                                                pokemonDetailsPokemonDetailsResponse
                                                    .jsonBody,
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()[2]
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                'Lexend Deca',
                                                color: const Color(0xB3FFFFFF),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
