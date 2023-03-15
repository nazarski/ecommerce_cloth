import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_type_find_entity/product_type_find_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'filter_values_provider.dart';
import 'paging_controller_provider.dart';
import 'use_cases_reference.dart';

final productTypesProvider = FutureProvider.family
    .autoDispose<List<String>, ProductTypeFindEntity>((ref, finder) async {
  final List<String> productTypes =
      await getProducts.getProductTypes(finder: finder);
  final filter = ref.read(filterValuesProvider.notifier)
    ..setProductTypes(productTypes: productTypes);
  ref.read(pagingControllerProvider.notifier).firstLaunch(filter.filter);
  return productTypes;
});
