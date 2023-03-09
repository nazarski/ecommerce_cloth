import 'dart:developer';

import 'package:ecommerce_cloth/data/data_sources/remote/manage_products_data.dart';
import 'package:ecommerce_cloth/data/models/product_model/product_model.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_products_repository.dart';

class ManageProductsRepositoryImpl implements ManageProductsRepository {
  @override
  Future<List<ProductEntity>> getProductsFromDate(DateTime startDate) async {
    try {
      final List<ProductModel>? models =
          await ManageProductsData.getProductsFromDate(startDate);
      return models!.map((e) => e.toEntity()).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  const ManageProductsRepositoryImpl();

  @override
  Future<List<String>> getProductTypes({
    required String productGroup,
    required String attribute,
    required String categoryId,
  }) async {
    try {
      final data = await ManageProductsData.getProductTypes(
          productGroup: productGroup,
          attribute: attribute,
          categoryId: categoryId);
      return data!;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
