import 'package:ecommerce_cloth/presentation/pages/bag_page/widgets/cart_item.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_cart_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              return CartItem(
                cartItem: data[index],
                incItem: () {
                  ref
                      .read(userCartProvider.notifier)
                      .changeQuantity(1, data[index]);
                },
                decItem: () {
                  ref
                      .read(userCartProvider.notifier)
                      .changeQuantity(-1, data[index]);
                },
                addToFavorites: () {
                  ref.read(userInfoProvider.notifier).addToFavourites(
                        systemProductId: data[index].product.systemId,
                        selectedSize: data[index].size,
                      );
                },
                removeFromCart: () {
                  ref
                      .read(userCartProvider.notifier)
                      .removeCartItem(cartItem: data[index]);
                },
              );
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
                child: const ShimmerWidget(),
              ),
            );
          }),
          itemExtent: 128,
        );
      },
    );
  }
}
