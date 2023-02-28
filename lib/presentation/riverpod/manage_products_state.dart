import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/data/repositories/manare_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_products/get_products.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const getProducts = GetProducts(ManageProductsRepositoryImpl());

final newProductsProvider =
    FutureProvider.family<List<ProductEntity>, ProductSliderType>(
        (ref, type) async {
  final result = await getProducts.getByType(type);
  return result;
});
