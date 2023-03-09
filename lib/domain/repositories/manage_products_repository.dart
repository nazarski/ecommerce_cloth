import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';

abstract class ManageProductsRepository {
  Future<List<ProductEntity>> getProductsFromDate(DateTime startDate);

  Future<List<String>> getProductTypes(
      {required String productGroup,
      required String attribute,
      required String categoryId});

}
