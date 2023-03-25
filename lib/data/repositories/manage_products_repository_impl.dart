import 'package:ecommerce_cloth/core/enums/sort_type.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/manage_products_data.dart';
import 'package:ecommerce_cloth/data/models/product_model/product_model.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_products_repository.dart';

class ManageProductsRepositoryImpl implements ManageProductsRepository {
  @override
  Future<List<ProductEntity>> getProductsFromDate(DateTime startDate) async {
    try {
      final List<ProductModel> models =
          await ManageProductsData.getProductsFromDate(startDate);
      return models.map((e) => e.toEntity()).toList();
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
      return await ManageProductsData.getProductTypes(
          productGroup: productGroup,
          attribute: attribute,
          categoryId: categoryId);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<ProductEntity>> getProductsFromFilter({
    required int fromPrice,
    required int toPrice,
    required List<String> sizes,
    required List<String> colors,
    required List<String> brandNames,
    required List<String> productTypes,
    required int page,
    required SortType sortType,
  }) async {
    try {
      final list = await ManageProductsData.getProductsByFilterValues(
        fromPrice: fromPrice,
        toPrice: toPrice,
        sizes: sizes,
        colors: colors,
        brandNames: brandNames,
        productTypes: productTypes,
        page: page,
        sortType: sortType,
      );
      return list.map((e) => e.toEntity()).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
  @override
  Future<List<ProductEntity>> getSimilarProducts({
    required int fromPrice,
    required int toPrice,
    required List<String> sizes,
    required List<String> colors,
    required List<String> productTypes,
    required String productId
  }) async {
    try {
      final list = await ManageProductsData.getLimitedProductsByFilterValue(
        fromPrice: fromPrice,
        toPrice: toPrice,
        sizes: sizes,
        colors: colors,
        productTypes: productTypes,
        productId: productId
      );
      return list.map((e) => e.toEntity()).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
