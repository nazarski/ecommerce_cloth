import 'package:ecommerce_cloth/core/enums/sort_type.dart';
import 'package:equatable/equatable.dart';

class ProductFilterEntity extends Equatable {
  final int? fromPrice;
  final int? toPrice;
  final String? color;
  final List<String>? productTypes;
  final List<String>? sizes;
  final List<String>? attributes;
  final List<String>? brandNames;
  final SortType? sortType;

  const ProductFilterEntity({
    this.fromPrice,
    this.toPrice,
    this.color,
    this.sizes,
    this.attributes,
    this.brandNames,
    this.sortType,
    this.productTypes,
  });

  @override
  List<Object?> get props => [
        productTypes,
        fromPrice,
        toPrice,
        color,
        sizes,
        attributes,
        brandNames,
        sortType,
      ];

  ProductFilterEntity copyWith({
    int? fromPrice,
    int? toPrice,
    String? color,
    List<String>? productTypes,
    List<String>? sizes,
    List<String>? attributes,
    List<String>? brandNames,
    SortType? sortType,
  }) {
    return ProductFilterEntity(
      fromPrice: fromPrice ?? this.fromPrice,
      toPrice: toPrice ?? this.toPrice,
      color: color ?? this.color,
      productTypes: productTypes ?? this.productTypes,
      sizes: sizes ?? this.sizes,
      attributes: attributes ?? this.attributes,
      brandNames: brandNames ?? this.brandNames,
      sortType: sortType ?? this.sortType,
    );
  }
}
