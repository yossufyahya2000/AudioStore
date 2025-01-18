import '/flutter_flow/flutter_flow_util.dart';
import 'product_page_widget.dart' show ProductPageWidget;
import 'package:flutter/material.dart';

class ProductPageModel extends FlutterFlowModel<ProductPageWidget> {
  ///  Local state fields for this page.

  List<int> cartElements = [];
  void addToCartElements(int item) => cartElements.add(item);
  void removeFromCartElements(int item) => cartElements.remove(item);
  void removeAtIndexFromCartElements(int index) => cartElements.removeAt(index);
  void insertAtIndexInCartElements(int index, int item) =>
      cartElements.insert(index, item);
  void updateCartElementsAtIndex(int index, Function(int) updateFn) =>
      cartElements[index] = updateFn(cartElements[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
