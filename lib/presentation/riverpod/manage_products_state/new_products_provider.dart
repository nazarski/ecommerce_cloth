import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'use_cases_reference.dart';

final newProductsProvider =
    FutureProvider.family<List<ProductEntity>, ProductSliderType>(
        (ref, type) async {
  final result = await getProducts.getByType(type);
  return result;
});









// final productListProvider = StateNotifierProvider.autoDispose<
//     ProductListProvider, AsyncValue<List<ProductEntity>>>((ref) {
//   return ProductListProvider();
// });
//
// class ProductListProvider
//     extends StateNotifier<AsyncValue<List<ProductEntity>>> {
//   ProductListProvider() : super(const AsyncValue.loading());
//
//   Future<void> getProductsFromFilter(ProductFilterEntity filter) async {
//     try {
//       final List<ProductEntity> products =
//           await _getProducts.getProductsByFilter(filter);
//       state = AsyncValue.data([...state.value ?? [], ...products]);
//     } catch (error) {
//       state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
//     }
//   }
// }
// final productListProvider =
//     FutureProvider.autoDispose<List<ProductEntity>>((ref) async {
//   final List<ProductEntity> products = await _getProducts.getProductsByFilter(filter);
//   return products;
// });
