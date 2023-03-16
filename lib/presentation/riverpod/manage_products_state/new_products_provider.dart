import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'use_cases_reference.dart';

final newProductsProvider =
    FutureProvider.family<List<ProductEntity>, ProductSliderType>(
        (ref, type) async {
  final result = await getProducts.getByType(type);
  return result;
});
