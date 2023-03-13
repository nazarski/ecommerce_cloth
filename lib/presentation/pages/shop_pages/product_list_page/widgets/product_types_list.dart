import 'dart:developer';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state.dart';
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
  // bool _showWidget = false;
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
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      '${data[i]}s',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.surfaceTint),
                    ),
                  ),
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
