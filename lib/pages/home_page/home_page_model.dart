import '/componants/add_componant/add_componant_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchResultPage widget.
  FocusNode? searchResultPageFocusNode;
  TextEditingController? searchResultPageTextController;
  String? Function(BuildContext, String?)?
      searchResultPageTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for addComponant dynamic component.
  late FlutterFlowDynamicModels<AddComponantModel> addComponantModels;

  @override
  void initState(BuildContext context) {
    addComponantModels = FlutterFlowDynamicModels(() => AddComponantModel());
  }

  @override
  void dispose() {
    searchResultPageFocusNode?.dispose();
    searchResultPageTextController?.dispose();

    addComponantModels.dispose();
  }
}
