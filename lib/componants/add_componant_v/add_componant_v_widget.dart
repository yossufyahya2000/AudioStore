import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'add_componant_v_model.dart';
export 'add_componant_v_model.dart';

class AddComponantVWidget extends StatefulWidget {
  const AddComponantVWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.productId,
  });

  final String? imageUrl;
  final String? title;
  final int? price;
  final int? productId;

  @override
  State<AddComponantVWidget> createState() => _AddComponantVWidgetState();
}

class _AddComponantVWidgetState extends State<AddComponantVWidget> {
  late AddComponantVModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddComponantVModel());

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
      width: 150.0,
      height: 240.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              1.0,
              1.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.imageUrl!,
                  width: 125.0,
                  height: 125.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.title,
                  'title',
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'DM Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 20.0),
                child: Text(
                  'USD ${widget.price?.toString()}',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'DM Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
