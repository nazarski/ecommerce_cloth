import 'dart:developer';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/collect_search_hierarchy_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/filter_values_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/paging_controller_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/product_types_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductTypesList extends ConsumerStatefulWidget {
  const ProductTypesList({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductTypesList> createState() => _ProductTypesListState();
}

class _ProductTypesListState extends ConsumerState<ProductTypesList>
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
    final finder = ref.watch(collectSearchHierarchyProvider.notifier).finder;
    final typesList = ref.watch(productTypesProvider(finder));
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
                return _ProductTypeChip(
                  type: data[i],
                  // active: isActive,
                );
              },
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        log(error.toString());
        log(stackTrace.toString());
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
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
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

class _ProductTypeChip extends ConsumerWidget {
  const _ProductTypeChip({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(filterValuesProvider);
    final filter = ref.watch(filterValuesProvider.notifier).filter;
    final isActive =
        filter.productTypes.length == 1 && filter.productTypes.first == type;
    return InkWell(
      onTap: isActive
          ? null
          : () {
              final filter = ref
                  .read(filterValuesProvider.notifier)
                  ..setProductTypes(productTypes: [type]);
              ref
                  .read(pagingControllerProvider.notifier)
                  .newFilerValue(filter.filter);
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.onSurfaceVariant,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            '${type}s',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.surfaceTint),
          ),
        ),
      ),
    );
  }
}
