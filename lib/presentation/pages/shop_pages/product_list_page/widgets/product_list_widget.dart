import 'package:ecommerce_cloth/data/data_sources/remote/manage_products_data.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state.dart';
import 'package:ecommerce_cloth/temp_admin/sandbox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'product_list_grid_view.dart';
import 'product_list_list_item.dart';
import 'product_list_list_view.dart';

class ProductListWidget extends ConsumerStatefulWidget {
  const ProductListWidget({
    super.key,
    required this.isGrid,
  });

  final bool isGrid;

  @override
  ConsumerState<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends ConsumerState<ProductListWidget> {
  static const _pageSize = 6;

  final PagingController<int, ProductEntity> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      print('start');
      final newItems = await ManageProductsData.testPagination(pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        print('if last');
        _pagingController.appendLastPage(newItems);
      } else {
        print('add more');
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ref.read(collectSearchHierarchyProvider).
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        sliver: PagedSliverList.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (BuildContext context, item, int index) {
              return ProductListListItem(
                product: item as ProductEntity,
              );
            }),
            separatorBuilder: (_, __) => SizedBox(
                  height: 20,
                ))

        // widget.isGrid
        //     ? const ProductListGridView()
        //     : const ProductListListView(),
        // ProductListListView(),
        );
  }
}
