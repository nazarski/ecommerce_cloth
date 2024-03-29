import 'package:ecommerce_cloth/presentation/pages/favourites_page/widgets/favourites_list_grid_item.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/favourites_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_cart_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesGridView extends ConsumerWidget {
  const FavouritesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritesProvider = ref.watch(favouritesListProvider);
    return favouritesProvider.when(data: (data) {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 280,
          childAspectRatio: 1 / 1.55,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return FavouritesListGridItem(
              hero: false,
              cartItem: data[index],
              onRemove: () async {
                await ref.read(userInfoProvider.notifier).removeFromFavourites(
                    systemProductId: data[index].product.systemId);
                final value = await ref.refresh(favouritesListProvider.future);
              },
              addToCart: () {
                ref.read(userCartProvider.notifier).addCartItem(
                    product: data[index].product, size: data[index].size);
              },
            );
          },
          childCount: data.length,
        ),
      );
    }, error: (error, stackTrace) {
      return const SliverToBoxAdapter(
        child: Text('Error'),
      );
    }, loading: () {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 280,
          childAspectRatio: 1 / 1.55,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const ShimmerWidget(),
              ),
            );
          },
          childCount: 10,
        ),
      );
    });
  }
}
