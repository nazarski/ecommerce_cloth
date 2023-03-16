import 'package:ecommerce_cloth/domain/entities/product_type_find_entity/product_type_find_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final collectSearchHierarchyProvider = StateNotifierProvider<
    CollectSearchHierarchyProvider, ProductTypeFindEntity>((_) {
  return CollectSearchHierarchyProvider();
});

class CollectSearchHierarchyProvider
    extends StateNotifier<ProductTypeFindEntity> {
  CollectSearchHierarchyProvider() : super(const ProductTypeFindEntity());

  void addCategoryId({required String categoryId}) {
    state = state.copyWith(
      categoryId: categoryId,
    );
  }

  void addAttribute({required String attribute}) {
    state = state.copyWith(
      attribute: attribute,
    );
  }

  void addProductGroup({required String productGroup}) {
    state = state.copyWith(
      productGroup: productGroup,
    );
  }

  ProductTypeFindEntity get finder => state;
}