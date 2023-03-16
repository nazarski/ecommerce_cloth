import 'package:ecommerce_cloth/core/enums/sort_type.dart';
import 'package:equatable/equatable.dart';

class ProductFilterEntity extends Equatable {
  final int fromPrice;
  final int toPrice;
  final List<String> colors;
  final List<String> productTypes;
  final List<String> sizes;
  final List<String> brandNames;
  final SortType sortType;
  final int page;

  const ProductFilterEntity({
    this.fromPrice = 0,
    this.toPrice = 99999999,
    this.colors = const [],
    this.sizes = const [],
    this.brandNames = const [],
    this.sortType = SortType.novelty,
    this.productTypes = const [],
    this.page = 1,
  });

  @override
  List<Object?> get props => [
        productTypes,
        fromPrice,
        toPrice,
        colors,
        sizes,
        brandNames,
        sortType,
        page,
      ];

  ProductFilterEntity copyWith({
    int? fromPrice,
    int? toPrice,
    List<String>? colors,
    List<String>? productTypes,
    List<String>? sizes,
    List<String>? attributes,
    List<String>? brandNames,
    SortType? sortType,
    int? page,
  }) {
    return ProductFilterEntity(
      fromPrice: fromPrice ?? this.fromPrice,
      toPrice: toPrice ?? this.toPrice,
      colors: colors ?? this.colors,
      productTypes: productTypes ?? this.productTypes,
      sizes: sizes ?? this.sizes,
      brandNames: brandNames ?? this.brandNames,
      sortType: sortType ?? this.sortType,
      page: page ?? 1,
    );
  }
}
