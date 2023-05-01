
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/product_list_grid_item.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/product_shimmer_grid.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/you_may_also_like_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YouMayAlsoLikeWidget extends StatelessWidget {
  const YouMayAlsoLikeWidget({
    required this.product,
    super.key,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            bottom: 12,
            left: 16,
            right: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'You can also like this',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                '12 items',
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
        _YMALProductList(
          product: product,
        ),
      ],
    );
  }
}

class _YMALProductList extends ConsumerWidget {
  const _YMALProductList({
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(youMayAlsoLikeProvider(product));
    return products.when(
      data: (data) {
        return SizedBox(
          height: 280,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return SizedBox(
                width: 150,
                child: ProductListGridItem(
                  product: data[i],
                  hero: false,
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              width: 12,
            ),
            itemCount: data.length,
          ),
        );
      },
      error: (e, stackTrace) => const Text('Error'),
      loading: () => SizedBox(
        height: 280,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return const SizedBox(
              width: 150,
              child: ProductShimmerGrid(),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
            width: 12,
          ),
          itemCount: 12,
        ),
      ),
    );
  }
}
