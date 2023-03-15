import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/product_list_grid_item.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/paging_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'product_list_list_item.dart';
import 'product_shimmer_grid.dart';
import 'product_shimmer_list.dart';

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
  @override
  Widget build(BuildContext context) {
    final controllerProvider = ref.watch(pagingControllerProvider);
    return controllerProvider.when(
      data: (controller) {
        if (widget.isGrid) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: PagedSliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 260,
                childAspectRatio: 1 / 1.55,
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                crossAxisCount: 2,
              ),
              pagingController: controller,
              builderDelegate: PagedChildBuilderDelegate(
                  firstPageProgressIndicatorBuilder: (_) =>
                      const ProductShimmerGrid(),
                  itemBuilder: (BuildContext context, item, int index) {
                    return ProductListGridItem(
                      product: item as ProductEntity,
                    );
                  }),
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: PagedSliverList.separated(
            pagingController: controller,
            builderDelegate: PagedChildBuilderDelegate(
                firstPageProgressIndicatorBuilder: (_) {
              return const ProductShimmerList();
            }, itemBuilder: (BuildContext context, item, int index) {
              return ProductListListItem(
                product: item as ProductEntity,
              );
            }),
            separatorBuilder: (_, __) => const SizedBox(
              height: 12,
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return SliverToBoxAdapter(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        sliver: SliverFillRemaining(
          child: widget.isGrid
              ? const ProductShimmerGrid()
              : const ProductShimmerList(),
        ),
      ),
    );
  }
}
