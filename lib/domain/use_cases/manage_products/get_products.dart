import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/data/repositories/manare_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_type_find_entity/product_type_find_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_products_repository.dart';
import 'package:ecommerce_cloth/presentation/pages/home_page/widgets/product_slider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      fromPrice: filter.toPrice ?? 0,
      toPrice: filter.toPrice ?? 0,
      sizes: filter.sizes ?? [],
      colors: filter.colors ?? [],
      brandNames: filter.brandNames ?? [],
      productTypes: filter.productTypes ?? [],
      page: filter.page ?? 1,
    );
    return listOfProducts;
  }
}
