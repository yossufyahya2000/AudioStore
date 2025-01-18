import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'button_chips_componant_model.dart';
export 'button_chips_componant_model.dart';

class ButtonChipsComponantWidget extends StatefulWidget {
  const ButtonChipsComponantWidget({super.key});

  @override
  State<ButtonChipsComponantWidget> createState() =>
      _ButtonChipsComponantWidgetState();
}

class _ButtonChipsComponantWidgetState
    extends State<ButtonChipsComponantWidget> {
  late ButtonChipsComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonChipsComponantModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Wrap(
        spacing: 12.0,
        runSpacing: 12.0,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        verticalDirection: VerticalDirection.down,
        clipBehavior: Clip.none,
        children: [
          FFButtonWidget(
            onPressed: () async {
              _model.choice = 'Popularity';
              safeSetState(() {});
            },
            text: 'Popularity',
            options: FFButtonOptions(
              height: 42.0,
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: _model.choice == 'Popularity'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'DM Sans',
                    color: _model.choice == 'Popularity'
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: _model.choice == 'Popularity'
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).tertiary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              _model.choice = 'Newest';
              safeSetState(() {});
            },
            text: 'Newest',
            options: FFButtonOptions(
              height: 42.0,
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: _model.choice == 'Newest'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'DM Sans',
                    color: _model.choice == 'Newest'
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: _model.choice == 'Newest'
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).tertiary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              _model.choice = 'Oldest';
              safeSetState(() {});
            },
            text: 'Oldest',
            options: FFButtonOptions(
              height: 42.0,
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: _model.choice == 'Oldest'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'DM Sans',
                    color: _model.choice == 'Oldest'
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: _model.choice == 'Oldest'
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).tertiary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              _model.choice = 'High Price';
              safeSetState(() {});
            },
            text: 'High Price',
            options: FFButtonOptions(
              height: 42.0,
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: _model.choice == 'High Price'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'DM Sans',
                    color: _model.choice == 'High Price'
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: _model.choice == 'High Price'
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).tertiary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              _model.choice = 'Low Price';
              safeSetState(() {});
            },
            text: 'Low Price',
            options: FFButtonOptions(
              height: 42.0,
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: _model.choice == 'Low Price'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'DM Sans',
                    color: _model.choice == 'Low Price'
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: _model.choice == 'Low Price'
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).tertiary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              _model.choice = 'Review';
              safeSetState(() {});
            },
            text: 'Review',
            options: FFButtonOptions(
              height: 42.0,
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: _model.choice == 'Review'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'DM Sans',
                    color: _model.choice == 'Review'
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: _model.choice == 'Review'
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).tertiary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ],
      ),
    );
  }
}
