import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_item_componant_model.dart';
export 'cart_item_componant_model.dart';

class CartItemComponantWidget extends StatefulWidget {
  const CartItemComponantWidget({
    super.key,
    required this.productId,
    required this.userRow,
    required this.refreshPage,
  });

  final int? productId;
  final UsersRow? userRow;
  final Future Function()? refreshPage;

  @override
  State<CartItemComponantWidget> createState() =>
      _CartItemComponantWidgetState();
}

class _CartItemComponantWidgetState extends State<CartItemComponantWidget> {
  late CartItemComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemComponantModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.itemsOnCart = widget.userRow!.cartProducts.toList().cast<int>();
      _model.itemsOnCart = _model.itemsOnCart
          .where((e) => e == widget.productId)
          .toList()
          .toList()
          .cast<int>();
      _model.noOfItems = _model.itemsOnCart.length;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductsRow>>(
      future: ProductsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.productId,
        ),
      ),
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
        List<ProductsRow> containerProductsRowList = snapshot.data!;

        final containerProductsRow = containerProductsRowList.isNotEmpty
            ? containerProductsRowList.first
            : null;

        return Container(
          width: double.infinity,
          height: 90.0,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  containerProductsRow!.imageUrl,
                  width: 90.0,
                  height: 90.0,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          containerProductsRow.name,
                          'name',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'DM Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            'USD ${containerProductsRow.price.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 115.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 0.0,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'DM Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                count: _model.countControllerValue ??=
                                    _model.noOfItems,
                                updateCount: (count) async {
                                  safeSetState(() =>
                                      _model.countControllerValue = count);
                                  _model.itemstoCount = widget
                                      .userRow!.cartProducts
                                      .toList()
                                      .cast<int>();
                                  _model.productsRemoved =
                                      await actions.removeSpecificValue(
                                    _model.itemstoCount.toList(),
                                    widget.productId!,
                                  );
                                  _model.finalProducts =
                                      await actions.addNumberWithRepeats(
                                    _model.productsRemoved!.toList(),
                                    widget.productId!,
                                    _model.countControllerValue!,
                                  );
                                  await UsersTable().update(
                                    data: {
                                      'cart_products': _model.finalProducts,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      currentUserUid,
                                    ),
                                  );
                                  await UpdateTotalPriceCall.call(
                                    userId: currentUserUid,
                                  );

                                  await widget.refreshPage?.call();

                                  safeSetState(() {});
                                },
                                stepSize: 1,
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              icon: FaIcon(
                                FontAwesomeIcons.trashAlt,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 23.0,
                              ),
                              onPressed: () async {
                                _model.newListAfterDelete =
                                    await actions.removeSpecificValue(
                                  widget.userRow!.cartProducts.toList(),
                                  widget.productId!,
                                );
                                await UsersTable().update(
                                  data: {
                                    'cart_products': _model.newListAfterDelete,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget.userRow?.id,
                                  ),
                                );
                                await UpdateTotalPriceCall.call(
                                  userId: currentUserUid,
                                );

                                await widget.refreshPage?.call();

                                safeSetState(() {});
                              },
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
        );
      },
    );
  }
}
