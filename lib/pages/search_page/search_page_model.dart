import '/componants/h_product_componant/h_product_componant_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchText widget.
  FocusNode? searchTextFocusNode;
  TextEditingController? searchTextTextController;
  String? Function(BuildContext, String?)? searchTextTextControllerValidator;
  // Models for hProductComponant dynamic component.
  late FlutterFlowDynamicModels<HProductComponantModel> hProductComponantModels;

  @override
  void initState(BuildContext context) {
    hProductComponantModels =
        FlutterFlowDynamicModels(() => HProductComponantModel());
  }

  @override
  void dispose() {
    searchTextFocusNode?.dispose();
    searchTextTextController?.dispose();

    hProductComponantModels.dispose();
  }
}
