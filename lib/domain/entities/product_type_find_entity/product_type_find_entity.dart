import 'package:equatable/equatable.dart';

class ProductTypeFindEntity extends Equatable {
  final String attribute;
  final String categoryId;
  final String productGroup;

  const ProductTypeFindEntity({
    this.attribute = '',
    this.categoryId = '',
    this.productGroup = '',
  });

  @override
  String toString() {
    return 'ProductTypeFindEntity{attribute: $attribute, categoryId: $categoryId, productGroup: $productGroup}';
  }

  ProductTypeFindEntity copyWith({
    String? attribute,
    String? categoryId,
    String? productGroup,
  }) {
    return ProductTypeFindEntity(
      attribute: attribute ?? this.attribute,
      categoryId: categoryId ?? this.categoryId,
      productGroup: productGroup ?? this.productGroup,
    );
  }

  @override
  List<Object?> get props => [
        attribute,
        categoryId,
        productGroup,
      ];
}
