// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltersStruct extends BaseStruct {
  FiltersStruct({
    String? category,
    String? sortBy,
    int? minPrice,
    int? maxPrice,
  })  : _category = category,
        _sortBy = sortBy,
        _minPrice = minPrice,
        _maxPrice = maxPrice;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "sortBy" field.
  String? _sortBy;
  String get sortBy => _sortBy ?? '';
  set sortBy(String? val) => _sortBy = val;

  bool hasSortBy() => _sortBy != null;

  // "minPrice" field.
  int? _minPrice;
  int get minPrice => _minPrice ?? 0;
  set minPrice(int? val) => _minPrice = val;

  void incrementMinPrice(int amount) => minPrice = minPrice + amount;

  bool hasMinPrice() => _minPrice != null;

  // "maxPrice" field.
  int? _maxPrice;
  int get maxPrice => _maxPrice ?? 0;
  set maxPrice(int? val) => _maxPrice = val;

  void incrementMaxPrice(int amount) => maxPrice = maxPrice + amount;

  bool hasMaxPrice() => _maxPrice != null;

  static FiltersStruct fromMap(Map<String, dynamic> data) => FiltersStruct(
        category: data['category'] as String?,
        sortBy: data['sortBy'] as String?,
        minPrice: castToType<int>(data['minPrice']),
        maxPrice: castToType<int>(data['maxPrice']),
      );

  static FiltersStruct? maybeFromMap(dynamic data) =>
      data is Map ? FiltersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'sortBy': _sortBy,
        'minPrice': _minPrice,
        'maxPrice': _maxPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'sortBy': serializeParam(
          _sortBy,
          ParamType.String,
        ),
        'minPrice': serializeParam(
          _minPrice,
          ParamType.int,
        ),
        'maxPrice': serializeParam(
          _maxPrice,
          ParamType.int,
        ),
      }.withoutNulls;

  static FiltersStruct fromSerializableMap(Map<String, dynamic> data) =>
      FiltersStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        sortBy: deserializeParam(
          data['sortBy'],
          ParamType.String,
          false,
        ),
        minPrice: deserializeParam(
          data['minPrice'],
          ParamType.int,
          false,
        ),
        maxPrice: deserializeParam(
          data['maxPrice'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FiltersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FiltersStruct &&
        category == other.category &&
        sortBy == other.sortBy &&
        minPrice == other.minPrice &&
        maxPrice == other.maxPrice;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([category, sortBy, minPrice, maxPrice]);
}

FiltersStruct createFiltersStruct({
  String? category,
  String? sortBy,
  int? minPrice,
  int? maxPrice,
}) =>
    FiltersStruct(
      category: category,
      sortBy: sortBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
