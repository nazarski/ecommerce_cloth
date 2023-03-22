import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/product_item_shimmer.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/new_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/product_slider_item.dart';

class ProductSlider extends ConsumerWidget {
  const ProductSlider({
    super.key,
    required this.subtitle,
    required this.type,
  });

  final String subtitle;
  final ProductSliderType type;

  String getTitle() {
    return {
      ProductSliderType.newProducts: 'New',
      ProductSliderType.sale: 'Sale',
      ProductSliderType.hot: 'Hot',
    }[type]!;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfProducts = ref.watch(newProductsProvider(type));
    final String title = getTitle();
    return listOfProducts.when(
        data: (data) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('View all'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 14, bottom: 20, right: 14),
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return ProductSliderItem(product: data[i],
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 18,
                    ),
                  ),
                )
              ],
            ),
        error: (Object error, StackTrace stackTrace) => const Text('Error'),
        loading: () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const TextButton(
                      onPressed: null, child: Text('View all'))
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 14, bottom: 20),
                itemCount: 10,
                itemBuilder: (context, i) {
                  return const ProductSliderShimmer(
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  width: 18,
                ),
              ),
            )
          ],
        ),
    );
  }
}
