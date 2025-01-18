import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'empty_wedgit_model.dart';
export 'empty_wedgit_model.dart';

class EmptyWedgitWidget extends StatefulWidget {
  const EmptyWedgitWidget({super.key});

  @override
  State<EmptyWedgitWidget> createState() => _EmptyWedgitWidgetState();
}

class _EmptyWedgitWidgetState extends State<EmptyWedgitWidget>
    with TickerProviderStateMixin {
  late EmptyWedgitModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyWedgitModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 250.0.ms,
            begin: const Offset(2.0, 2.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Add your first product to the cart',
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'DM Sans',
                letterSpacing: 0.0,
              ),
        ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
      ],
    );
  }
}
