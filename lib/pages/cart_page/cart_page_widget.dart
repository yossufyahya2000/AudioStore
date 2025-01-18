import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componants/empty_wedgit/empty_wedgit_widget.dart';
import '/components/cart_item_componant_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shake/shake.dart';
import 'cart_page_model.dart';
export 'cart_page_model.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({super.key});

  @override
  State<CartPageWidget> createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  late CartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ShakeDetector shakeDetector;
  var shakeActionInProgress = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult4pb = await UpdateTotalPriceCall.call(
        userId: currentUserUid,
      );

      if ((_model.apiResult4pb?.succeeded ?? true)) {
        _model.myUser = await UsersTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            currentUserUid,
          ),
        );
        _model.userRow = _model.myUser?.firstOrNull;
        _model.totalPrice = _model.userRow!.totalPrice!;
        _model.noOfItems = _model.userRow?.cartProducts.length;
        safeSetState(() {});
      }
    });

    // On shake action.
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        if (shakeActionInProgress) {
          return;
        }
        shakeActionInProgress = true;
        try {
          _model.cartItemsAction = await UsersTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'id',
              currentUserUid,
            ),
          );
          _model.userRow = _model.cartItemsAction?.firstOrNull;
          _model.itemsInCart =
              _model.userRow!.cartProducts.toList().cast<int>();
          _model.counter = 0;
          while (_model.counter < _model.itemsInCart.length) {
            _model.itemPrice = await ProductsTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'id',
                _model.itemsInCart.elementAtOrNull(_model.counter),
              ),
            );
            _model.productRowCounter = _model.itemPrice?.firstOrNull;
            _model.counter = _model.counter + 1;
            _model.totalPrice =
                _model.totalPrice + _model.productRowCounter!.price;
          }

          safeSetState(() {});
        } finally {
          shakeActionInProgress = false;
        }
      },
      shakeThresholdGravity: 1.5,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF414A60),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width < kBreakpointSmall
                      ? double.infinity
                      : FFAppConstants.appWidth.toDouble(),
                  height: MediaQuery.sizeOf(context).width < kBreakpointSmall
                      ? double.infinity
                      : FFAppConstants.appHight.toDouble(),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: StreamBuilder<List<UsersRow>>(
                    stream: _model.columnSupabaseStream ??= SupaFlow.client
                        .from("users")
                        .stream(primaryKey: ['id'])
                        .eqOrNull(
                          'id',
                          currentUserUid,
                        )
                        .map((list) =>
                            list.map((item) => UsersRow(item)).toList()),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UsersRow> columnUsersRowList = snapshot.data!;

                      final columnUsersRow = columnUsersRowList.isNotEmpty
                          ? columnUsersRowList.first
                          : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 15.0, 25.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 28.0,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Shopping Cart',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                fontSize: 19.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await UsersTable().update(
                                      data: {
                                        'cart_products': [],
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        columnUsersRow?.id,
                                      ),
                                    );
                                    _model.apiResult1m4 =
                                        await UpdateTotalPriceCall.call(
                                      userId: columnUsersRow?.id,
                                    );

                                    if ((_model.apiResult1m4?.succeeded ??
                                        true)) {
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.trashAlt,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 23.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  25.0, 35.0, 25.0, 35.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final cartItems = columnUsersRow
                                                      ?.cartProducts
                                                      .unique((e) => e)
                                                      .toList() ??
                                                  [];
                                              if (cartItems.isEmpty) {
                                                return const SizedBox(
                                                  height: 500.0,
                                                  child: EmptyWedgitWidget(),
                                                );
                                              }

                                              return SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: List.generate(
                                                          cartItems.length,
                                                          (cartItemsIndex) {
                                                    final cartItemsItem =
                                                        cartItems[
                                                            cartItemsIndex];
                                                    return CartItemComponantWidget(
                                                      key: Key(
                                                          'Keyeoe_${cartItemsIndex}_of_${cartItems.length}'),
                                                      productId: cartItemsItem,
                                                      userRow: columnUsersRow!,
                                                      refreshPage: () async {
                                                        _model.apiResult3jaa =
                                                            await UpdateTotalPriceCall
                                                                .call(
                                                          userId: columnUsersRow
                                                              .id,
                                                        );

                                                        if ((_model
                                                                .apiResult3jaa
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.myUser2 =
                                                              await UsersTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'id',
                                                              currentUserUid,
                                                            ),
                                                          );
                                                          _model.userRow =
                                                              _model.myUser2
                                                                  ?.firstOrNull;
                                                          _model.totalPrice =
                                                              _model.userRow!
                                                                  .totalPrice!;
                                                          _model.noOfItems =
                                                              _model
                                                                  .userRow
                                                                  ?.cartProducts
                                                                  .length;
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                    );
                                                  })
                                                      .divide(const SizedBox(
                                                          height: 25.0))
                                                      .addToStart(const SizedBox(
                                                          height: 25.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Opacity(
                                            opacity: 0.6,
                                            child: Text(
                                              'Total ${columnUsersRow?.cartProducts.length.toString()} Items',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'USD ${columnUsersRow!.cartProducts.isNotEmpty ? columnUsersRow.totalPrice?.toString() : '0'}',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'DM Sans',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.stripeApiOutput =
                                                      await CreatStripeCheckOutLinkCall
                                                          .call(
                                                    price:
                                                        _model.totalPrice * 100,
                                                  );

                                                  if ((_model.stripeApiOutput
                                                          ?.succeeded ??
                                                      true)) {
                                                    await launchURL(
                                                        CreatStripeCheckOutLinkCall
                                                            .stripeCheckOutLink(
                                                      (_model.stripeApiOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!);
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Payment Erorr',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                30.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Proceed to Checkout',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .chevronRight,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              if (false &&
                  responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                Align(
                  alignment: const AlignmentDirectional(0.9, 0.85),
                  child: Text(
                    'This app has been developed by\nyossuf yahia',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
