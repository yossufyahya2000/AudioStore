import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'Products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(super.data);

  @override
  SupabaseTable get table => ProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get price => getField<int>('price')!;
  set price(int value) => setField<int>('price', value);

  String get features => getField<String>('features')!;
  set features(String value) => setField<String>('features', value);

  String get category => getField<String>('Category')!;
  set category(String value) => setField<String>('Category', value);

  double get reviewScore => getField<double>('review_score')!;
  set reviewScore(double value) => setField<double>('review_score', value);

  int get noOfReviews => getField<int>('no_of_reviews')!;
  set noOfReviews(int value) => setField<int>('no_of_reviews', value);

  bool get featuredProduct => getField<bool>('featured_product')!;
  set featuredProduct(bool value) => setField<bool>('featured_product', value);

  bool get advertisement => getField<bool>('advertisement')!;
  set advertisement(bool value) => setField<bool>('advertisement', value);

  String get imageUrl => getField<String>('image_url')!;
  set imageUrl(String value) => setField<String>('image_url', value);

  List<String> get arrImagesUrl => getListField<String>('arr_images_url');
  set arrImagesUrl(List<String>? value) =>
      setListField<String>('arr_images_url', value);

  bool get searchProducts => getField<bool>('search_products')!;
  set searchProducts(bool value) => setField<bool>('search_products', value);
}
