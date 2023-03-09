import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/data/repositories/manare_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
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
        (ref) => ProductTypesProvider());

class ProductTypesProvider extends StateNotifier<AsyncValue<List<String>>> {
  ProductTypesProvider() : super(const AsyncValue.loading());
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
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
    }
  }
}
