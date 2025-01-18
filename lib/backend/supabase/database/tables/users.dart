import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get profiePhoto => getField<String>('profie_photo');
  set profiePhoto(String? value) => setField<String>('profie_photo', value);

  int? get noCart => getField<int>('no_cart');
  set noCart(int? value) => setField<int>('no_cart', value);

  List<int> get cartProducts => getListField<int>('cart_products');
  set cartProducts(List<int>? value) =>
      setListField<int>('cart_products', value);

  int? get totalPrice => getField<int>('total_price');
  set totalPrice(int? value) => setField<int>('total_price', value);
}
