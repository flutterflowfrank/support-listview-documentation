import '/backend/schema/structs/index.dart';
import '/components/con_email_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtMsg widget.
  FocusNode? txtMsgFocusNode;
  TextEditingController? txtMsgController;
  String? Function(BuildContext, String?)? txtMsgControllerValidator;
  // Model for conEmail component.
  late ConEmailModel conEmailModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    conEmailModel = createModel(context, () => ConEmailModel());
  }

  void dispose() {
    unfocusNode.dispose();
    txtMsgFocusNode?.dispose();
    txtMsgController?.dispose();

    conEmailModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
