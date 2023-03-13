import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';

abstract class ManageProductsRepository {
  Future<List<ProductEntity>> getProductsFromDate(DateTime startDate);

  Future<List<String>> getProductTypes(
      {required String productGroup,
      required String attribute,
      required String categoryId});

  Future<List<ProductEntity>> getProductsFromFilter({
    required int page,
    required int fromPrice,
    required int toPrice,
    required List<String> sizes,
    required List<String> colors,
    required List<String> brandNames,
    required List<String> productTypes,
  });
}
