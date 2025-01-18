import '/flutter_flow/flutter_flow_util.dart';
import 'cart_item_componant_widget.dart' show CartItemComponantWidget;
import 'package:flutter/material.dart';

class CartItemComponantModel extends FlutterFlowModel<CartItemComponantWidget> {
  ///  Local state fields for this component.

  List<int> cartElements = [];
  void addToCartElements(int item) => cartElements.add(item);
  void removeFromCartElements(int item) => cartElements.remove(item);
  void removeAtIndexFromCartElements(int index) => cartElements.removeAt(index);
  void insertAtIndexInCartElements(int index, int item) =>
      cartElements.insert(index, item);
  void updateCartElementsAtIndex(int index, Function(int) updateFn) =>
      cartElements[index] = updateFn(cartElements[index]);

  List<int> itemsOnCart = [];
  void addToItemsOnCart(int item) => itemsOnCart.add(item);
  void removeFromItemsOnCart(int item) => itemsOnCart.remove(item);
  void removeAtIndexFromItemsOnCart(int index) => itemsOnCart.removeAt(index);
  void insertAtIndexInItemsOnCart(int index, int item) =>
      itemsOnCart.insert(index, item);
  void updateItemsOnCartAtIndex(int index, Function(int) updateFn) =>
      itemsOnCart[index] = updateFn(itemsOnCart[index]);

  int noOfItems = 1;

  int counter = 0;

  List<int> itemstoCount = [];
  void addToItemstoCount(int item) => itemstoCount.add(item);
  void removeFromItemstoCount(int item) => itemstoCount.remove(item);
  void removeAtIndexFromItemstoCount(int index) => itemstoCount.removeAt(index);
  void insertAtIndexInItemstoCount(int index, int item) =>
      itemstoCount.insert(index, item);
  void updateItemstoCountAtIndex(int index, Function(int) updateFn) =>
      itemstoCount[index] = updateFn(itemstoCount[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Custom Action - removeSpecificValue] action in CountController widget.
  List<int>? productsRemoved;
  // Stores action output result for [Custom Action - addNumberWithRepeats] action in CountController widget.
  List<int>? finalProducts;
  // Stores action output result for [Custom Action - removeSpecificValue] action in IconButton widget.
  List<int>? newListAfterDelete;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
