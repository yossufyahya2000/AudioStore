import '/flutter_flow/flutter_flow_util.dart';
import 'log_in_widget.dart' show LogInWidget;
import 'package:flutter/material.dart';

class LogInModel extends FlutterFlowModel<LogInWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for enterEmailText widget.
  FocusNode? enterEmailTextFocusNode;
  TextEditingController? enterEmailTextTextController;
  String? Function(BuildContext, String?)?
      enterEmailTextTextControllerValidator;
  String? _enterEmailTextTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for enterPasswordText widget.
  FocusNode? enterPasswordTextFocusNode;
  TextEditingController? enterPasswordTextTextController;
  late bool enterPasswordTextVisibility;
  String? Function(BuildContext, String?)?
      enterPasswordTextTextControllerValidator;
  String? _enterPasswordTextTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Password must be more than 6 characters';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    enterEmailTextTextControllerValidator =
        _enterEmailTextTextControllerValidator;
    enterPasswordTextVisibility = false;
    enterPasswordTextTextControllerValidator =
        _enterPasswordTextTextControllerValidator;
  }

  @override
  void dispose() {
    enterEmailTextFocusNode?.dispose();
    enterEmailTextTextController?.dispose();

    enterPasswordTextFocusNode?.dispose();
    enterPasswordTextTextController?.dispose();
  }
}
