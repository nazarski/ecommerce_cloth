import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/data/repositories/manage_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_type_find_entity/product_type_find_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_products_repository.dart';

class GetProducts {
  final ManageProductsRepository _productsRepository;

  const GetProducts(this._productsRepository);

  Future<List<ProductEntity>> _getNewProducts() async {
    final DateTime weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return await _productsRepository.getProductsFromDate(weekAgo);
  }

  Future<List<ProductEntity>> _getSaleProducts() async {
    final DateTime weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return await _productsRepository.getProductsFromDate(weekAgo);
  }

  Future<List<ProductEntity>> _getHotProducts() async {
    final DateTime weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return await _productsRepository.getProductsFromDate(weekAgo);
  }

  Future<List<ProductEntity>> getByType(ProductSliderType type) async {
    switch (type) {
      case ProductSliderType.newProducts:
        return await _getNewProducts();
      case ProductSliderType.sale:
        return await _getHotProducts();
      case ProductSliderType.hot:
        return await _getSaleProducts();
    }
  }

  Future<List<String>> getProductTypes({
    required ProductTypeFindEntity finder,
  }) async {
    final data = await _productsRepository.getProductTypes(
      productGroup: finder.productGroup,
      attribute: finder.attribute,
      categoryId: finder.categoryId,
    );
    return data;
  }

  Future<List<ProductEntity>> getProductsByFilter(
      ProductFilterEntity filter) async {
    final listOfProducts = await _productsRepository.getProductsFromFilter(
      fromPrice: filter.fromPrice,
      toPrice: filter.toPrice,
      sizes: filter.sizes ,
      colors: filter.colors.toList() ,
      brandNames: filter.brandNames ,
      productTypes: filter.productTypes,
      page: filter.page,
      sortType: filter.sortType,
    );
    return listOfProducts;
  }
}
