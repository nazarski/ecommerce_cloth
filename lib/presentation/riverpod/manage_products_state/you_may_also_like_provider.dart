import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/use_cases_reference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final youMayAlsoLikeProvider = FutureProvider.autoDispose
    .family<List<ProductEntity>, ProductEntity>((ref, arg) async {
  return await getProducts.getProductsForYMAL(arg);
});
