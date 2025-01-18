import '/componants/add_componant_v/add_componant_v_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_result_page_widget.dart' show SearchResultPageWidget;
import 'package:flutter/material.dart';

class SearchResultPageModel extends FlutterFlowModel<SearchResultPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for addComponantV dynamic component.
  late FlutterFlowDynamicModels<AddComponantVModel> addComponantVModels;

  @override
  void initState(BuildContext context) {
    addComponantVModels = FlutterFlowDynamicModels(() => AddComponantVModel());
  }

  @override
  void dispose() {
    addComponantVModels.dispose();
  }
}
