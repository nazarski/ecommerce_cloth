import 'package:ecommerce_cloth/core/utils/helpers/product_helpers.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BagPage extends StatelessWidget {
  const BagPage({Key? key}) : super(key: key);
  static const routeName = 'bag-page';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Material(
      color: Theme.of(context).colorScheme.background,
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: TransformingAppBar(
              ifPop: false,
              expandedHeight: height * .16,
              title: 'My Bag',
            ),
            pinned: true,
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            sliver: CartList(),
          )
        ],
      ),
    ));
  }
}

class CartList extends ConsumerWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsList = ref.watch(userCartProvider);
    return cartItemsList.when(
      data: (data) {
        return SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return CartItem(cartItem: data[index]);
            },
            childCount: data.length,
          ),
          itemExtent: 128,
        );
      },
      error: (error, stackTrace) {
        return SliverToBoxAdapter(child: Text(error.toString()));
      },
      loading: () {
        return SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const ShimmerWidget()),
            );
          }),
          itemExtent: 128,
        );
      },
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);
  final UserCartItemEntity cartItem;
  final String _addToFavorites = 'Add to favorites';
  final String _deleteFromTheList = 'Delete from the list';

  @override
  Widget build(BuildContext context) {
    final ProductEntity product = cartItem.product;
    final title = getTitle(
      name: product.name,
      brand: product.brand,
      type: product.productType,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(8)),
                child: Image.network(
                  product.thumbnail,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, top: 12, right: 8, bottom: 12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Color: ',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const WidgetSpan(
                                    child: SizedBox(
                                      width: 4,
                                    ),
                                  ),
                                  TextSpan(
                                    text: product.colors.first,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Size:',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const WidgetSpan(
                                    child: SizedBox(
                                      width: 4,
                                    ),
                                  ),
                                  TextSpan(
                                    text: cartItem.size,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.black,
                                  shape: CircleBorder(),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                              child: Icon(
                                Icons.remove,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            Text(
                              cartItem.quantity.toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.black,
                                  shape: CircleBorder(),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton(
                          itemBuilder: (context) {
                            final style = Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                );
                            return [
                              PopupMenuItem(
                                textStyle: style,
                                child: Center(
                                  child: Text(
                                    _addToFavorites,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                textStyle: style,
                                child: Center(
                                  child: Text(
                                    _deleteFromTheList,
                                  ),
                                ),
                              ),
                            ];
                          },
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          icon: const Icon(Icons.more_vert),
                        ),
                        Text("${product.price * cartItem.quantity}\$")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
