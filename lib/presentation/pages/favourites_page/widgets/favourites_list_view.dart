import 'package:ecommerce_cloth/presentation/pages/favourites_page/widgets/favourites_list_list_item.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/favourites_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesListView extends ConsumerWidget {
  const FavouritesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(userInfoProvider).id;
    final favouritesProvider = ref.watch(favouritesListProvider(userId));
    return favouritesProvider.when(data: (data) {
      return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return const FavouritesListListItem();
          },
          childCount: data.length,
        ),
        itemExtent: 120,
      );
    }, error: (error, stackTrace) {
      return const SliverToBoxAdapter(
        child: Text("Error"),
      );
    }, loading: () {
      return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const ShimmerWidget()),
            );
          },
          childCount: 10,
        ),
        itemExtent: 120,
      );
    });
  }
}

