import 'package:ecommerce_cloth/core/utils/helper.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/heart_favourite.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListListView extends ConsumerWidget {
  const ProductListListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(productListProvider);
    return list.when(
      data: (data) => SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, i) {
          return ProductListListItem(
            product: data[i],
          );
        }, childCount: data.length),
        itemExtent: 140,
      ),
      error: (error, stackTrace) => SliverFixedExtentList(
        delegate: SliverChildListDelegate([
          Text(error.toString()),
        ]),
        itemExtent: 140,
      ),
      loading: () => SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, i) {
          return const ShimmerWidget(
            height: 140,
          );
        }),
        itemExtent: 140,
      ),
    );
  }
}

class ProductListListItem extends StatelessWidget {
  const ProductListListItem({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final title = getTitle(
      name: product.name,
      brand: product.brand,
      type: product.productType,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: [
          Container(
            height: 112,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 5),
                      blurRadius: 5)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Row(
                children: [
                  Image(
                    image: NetworkImage(
                        '${StrapiInitialize.endpoint}${product.thumbnail}'),
                    width: MediaQuery.of(context).size.width * .33,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        product.brand,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const StarsViewWidget(rating: 4, reviews: 12),
                      Text(
                        '${product.price}\$',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: HeartFavourite(
              active: false,
            ),
          ),
        ],
      ),
    );
  }
}
