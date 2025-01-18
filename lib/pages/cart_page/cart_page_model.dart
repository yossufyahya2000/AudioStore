import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  Local state fields for this page.

  List<int> itemsInCart = [];
  void addToItemsInCart(int item) => itemsInCart.add(item);
  void removeFromItemsInCart(int item) => itemsInCart.remove(item);
  void removeAtIndexFromItemsInCart(int index) => itemsInCart.removeAt(index);
  void insertAtIndexInItemsInCart(int index, int item) =>
      itemsInCart.insert(index, item);
  void updateItemsInCartAtIndex(int index, Function(int) updateFn) =>
      itemsInCart[index] = updateFn(itemsInCart[index]);

  int counter = 0;

  int totalPrice = 0;

  ProductsRow? productRowCounter;

  int? noOfItems;

  UsersRow? userRow;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in CartPage widget.
  List<UsersRow>? cartItemsAction;
  // Stores action output result for [Backend Call - Query Rows] action in CartPage widget.
  List<ProductsRow>? itemPrice;
  // Stores action output result for [Backend Call - API (updateTotalPrice)] action in CartPage widget.
  ApiCallResponse? apiResult4pb;
  // Stores action output result for [Backend Call - Query Rows] action in CartPage widget.
  List<UsersRow>? myUser;
  Stream<List<UsersRow>>? columnSupabaseStream;
  // Stores action output result for [Backend Call - API (updateTotalPrice)] action in Icon widget.
  ApiCallResponse? apiResult1m4;
  // Stores action output result for [Backend Call - API (updateTotalPrice)] action in cartItemComponant widget.
  ApiCallResponse? apiResult3jaa;
  // Stores action output result for [Backend Call - Query Rows] action in cartItemComponant widget.
  List<UsersRow>? myUser2;
  // Stores action output result for [Backend Call - API (creatStripeCheckOutLink)] action in Container widget.
  ApiCallResponse? stripeApiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
