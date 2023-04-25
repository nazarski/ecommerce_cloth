import 'package:ecommerce_cloth/presentation/pages/favourites_page/widgets/favourites_grid_view.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/widgets/favourites_list_view.dart';
import 'package:flutter/material.dart';

class FavouritesListWidget extends StatelessWidget {
  const FavouritesListWidget({
    super.key,
    required this.isGrid,
  });

  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      return const SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        sliver: FavouritesGridView(),
      );
    }
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: FavouritesListView(),
    );
  }
}

