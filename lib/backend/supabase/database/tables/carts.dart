import '../database.dart';

class CartsTable extends SupabaseTable<CartsRow> {
  @override
  String get tableName => 'carts';

  @override
  CartsRow createRow(Map<String, dynamic> data) => CartsRow(data);
}

class CartsRow extends SupabaseDataRow {
  CartsRow(super.data);

  @override
  SupabaseTable get table => CartsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  List<int> get products => getListField<int>('products');
  set products(List<int>? value) => setListField<int>('products', value);
}
