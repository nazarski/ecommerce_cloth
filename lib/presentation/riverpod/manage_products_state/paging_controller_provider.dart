import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/filter_values_provider.dart';
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
  final PagingController<int, ProductEntity> _pagingController =
      PagingController(firstPageKey: 1);
  ProductFilterEntity _filter = const ProductFilterEntity();

  Future<void> getProductsFromFilter() async {
    try {
      _pagingController.addPageRequestListener((pageKey) async {
        _filter = _filter.copyWith(page: pageKey);
        final newItems = await getProducts.getProductsByFilter(_filter);
        final isLastPage = newItems.length < 10;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          _pagingController.appendPage(newItems, pageKey + 1);
        }
      });
      state = AsyncValue.data(_pagingController);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
    }
  }

  void firstLaunch(ProductFilterEntity filter) {
    _filter = filter;
    getProductsFromFilter();
  }

  void newFilerValue(ProductFilterEntity filter) {
    _filter = filter;
    _pagingController.refresh();
  }
}
