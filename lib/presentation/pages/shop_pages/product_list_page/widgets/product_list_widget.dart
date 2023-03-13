import 'package:ecommerce_cloth/temp_admin/sandbox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'product_list_grid_view.dart';
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
  static const _pageSize = 25;

  // final PagingController<int, CharacterSummary> _pagingController =
  // PagingController(firstPageKey: 0);
  //
  // @override
  // void initState() {
  //   _pagingController.addPageRequestListener((pageKey) {
  //     _fetchPage(pageKey);
  //   });
  //   super.initState();
  // }
  // @override
  // void dispose() {
  //   _pagingController.dispose();
  //   super.dispose();
  // }
  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     // final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
  //     final isLastPage = newItems.length < _pageSize;
  //     if (isLastPage) {
  //       _pagingController.appendLastPage(newItems);
  //     } else {
  //       // final nextPageKey = pageKey + newItems.length;
  //       // _pagingController.appendPage(newItems, nextPageKey);
  //     }
  //   } catch (error) {
  //     _pagingController.error = error;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: widget.isGrid
          ? const ProductListGridView()
          : const ProductListListView(),
      // ProductListListView(),
    );
  }
}