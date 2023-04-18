import 'dart:developer';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/product_type_chip.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/collect_search_hierarchy_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/product_types_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/favourites_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesTypesList extends ConsumerStatefulWidget {
  const FavouritesTypesList({Key? key}) : super(key: key);

  @override
  ConsumerState<FavouritesTypesList> createState() => _ProductTypesListState();
}

class _ProductTypesListState extends ConsumerState<FavouritesTypesList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref.read(userInfoProvider).id;
    final typesList = ref.watch(favouritesTypesProvider(userId));
    return typesList.when(
      data: (data) {
        _animationController.forward();
        return FadeTransition(
          opacity: _animationController,
          child: DecoratedBox(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.background),
            child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(
                width: 12,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, i) {
                return ProductTypeChip(
                  type: data[i],
                );
              },
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return const SizedBox(height: 30, child: Text('Error'));
      },
      loading: () => DecoratedBox(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            width: 12,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, i) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const ShimmerWidget(
                width: 100,
                height: 30,
              ),
            );
          },
        ),
      ),
    );
  }
}
