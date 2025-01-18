import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'add_componant_model.dart';
export 'add_componant_model.dart';

class AddComponantWidget extends StatefulWidget {
  const AddComponantWidget({
    super.key,
    required this.name,
    required this.image,
    required this.productId,
  });

  final String? name;
  final String? image;
  final int? productId;

  @override
  State<AddComponantWidget> createState() => _AddComponantWidgetState();
}

class _AddComponantWidgetState extends State<AddComponantWidget> {
  late AddComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddComponantModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.5, 10.0, 7.0, 10.0),
      child: Container(
        width: 300.0,
        height: 180.0,
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30.0, 25.0, 0.0, 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 150.0,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget.name,
                          'Title',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Shop now',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 0.0, 0.0),
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.image!,
                width: 117.0,
                height: 135.0,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
