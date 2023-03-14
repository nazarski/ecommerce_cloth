import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';

class ProductsPaginationEntity {
  final List<ProductEntity> listOfProducts;
  final int page;
  final String errorMessage;

  ProductsPaginationEntity({
    this.listOfProducts = const [],
    this.page = 1,
    this.errorMessage = '',
  });

  bool get refreshError => errorMessage != '' && listOfProducts.length <= 20;

  ProductsPaginationEntity copyWith({
    List<ProductEntity>? listOfProducts,
    int? page,
    String? errorMessage,
  }) {
    return ProductsPaginationEntity(
      listOfProducts: listOfProducts ?? this.listOfProducts,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
