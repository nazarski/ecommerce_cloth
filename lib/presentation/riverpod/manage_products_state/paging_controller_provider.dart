import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'use_cases_reference.dart';

final pagingControllerProvider = StateNotifierProvider.autoDispose<
    PagingControllerProvider,
    AsyncValue<PagingController<int, ProductEntity>>>((ref) {
  return PagingControllerProvider();
});

class PagingControllerProvider
    extends StateNotifier<AsyncValue<PagingController<int, ProductEntity>>> {
  PagingControllerProvider() : super(const AsyncValue.loading());
  final PagingController<int, ProductEntity> pagingController =
  PagingController(firstPageKey: 1);
  Future<void> getProductsFromFilter(ProductFilterEntity filter) async {
    try {
      Future<void> fetchPage(int pageKey) async {
        filter = filter.copyWith(page: pageKey);
        final newItems = await getProducts.getProductsByFilter(filter);
        final isLastPage = newItems.length < 10;
        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          pagingController.appendPage(newItems, pageKey + 1);
        }
      }
      pagingController.addPageRequestListener((pageKey) {
        fetchPage(pageKey);
      });
      state = AsyncValue.data(pagingController);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
    }
  }
}