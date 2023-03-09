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

  const ProductFilterEntity(
    this.fromPrice,
    this.toPrice,
    this.color,
    this.sizes,
    this.attributes,
    this.brandNames,
    this.sortType,
    this.productTypes,
  );

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
}
