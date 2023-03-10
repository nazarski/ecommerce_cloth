import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/data/repositories/manare_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_products/get_products.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _getProducts = GetProducts(ManageProductsRepositoryImpl());

final newProductsProvider =
    FutureProvider.family<List<ProductEntity>, ProductSliderType>(
        (ref, type) async {
  final result = await _getProducts.getByType(type);
  return result;
});

final productTypesProvider =
    StateNotifierProvider<ProductTypesProvider, AsyncValue<List<String>>>(
  (ref) => ProductTypesProvider(
    productListProviderRef: ref.read(productListProvider.notifier),
  ),
);

class ProductTypesProvider extends StateNotifier<AsyncValue<List<String>>> {
  ProductTypesProvider({required this.productListProviderRef})
      : super(const AsyncValue.loading());
  final ProductListProvider productListProviderRef;
  String? attribute;
  String? categoryId;
  String? productGroup;

  Future<void> selectProductGroup({
    required String productGroup,
  }) async {
    try {
      this.productGroup = productGroup;
      final List<String> productTypes = await _getProducts.getProductTypes(
        productGroup: productGroup,
        attribute: attribute!,
        categoryId: categoryId!,
      );
      state = AsyncValue.data(productTypes);
      productListProviderRef.filter = ProductFilterEntity(productTypes: productTypes);
      productListProviderRef.getFromProductTypes();
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
    }
  }
}

final productListProvider =
    StateNotifierProvider<ProductListProvider, AsyncValue<List<ProductEntity>>>(
        (ref) {
  return ProductListProvider();
});

class ProductListProvider
    extends StateNotifier<AsyncValue<List<ProductEntity>>> {
  ProductListProvider({this.filter}) : super(const AsyncValue.loading());

  ProductFilterEntity? filter;

  Future<void> getFromProductTypes() async {
    try {
      final products = await _getProducts.getProductsByFilter(filter!);
      state = AsyncValue.data(products);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
    }
  }
}
