import '/flutter_flow/flutter_flow_util.dart';
import 'add_review_componant_widget.dart' show AddReviewComponantWidget;
import 'package:flutter/material.dart';

class AddReviewComponantModel
    extends FlutterFlowModel<AddReviewComponantWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
