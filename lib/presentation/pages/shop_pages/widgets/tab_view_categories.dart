import 'package:ecommerce_cloth/presentation/riverpod/manage-categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'category_card.dart';
import 'new_card.dart';
import 'sale_card.dart';

class TabViewCategories extends ConsumerWidget {
  const TabViewCategories({
    super.key,
    required this.categoryGroup,
  });

  final String categoryGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoriesProvider(categoryGroup));
    return categoryProvider.when(
      data: (data) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SaleCard(
              attribute: categoryGroup,
            ),
            const SizedBox(
              height: 16,
            ),
            NewCard(
              attribute: categoryGroup,
            ),
            const SizedBox(
              height: 8,
            ),
            ...List.generate(data.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CategoryCard(
                  categoryTitle: data[index].categoryTitle,
                  imageLink: data[index].categoryImage,
                ),
              );
            })
          ],
        ),
      ),
      error: (Object error, StackTrace stackTrace) => const Text('Error'),
      loading: () => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Shimmer.fromColors(
                  baseColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.1),
                  highlightColor:
                      Theme.of(context).colorScheme.background.withOpacity(0.3),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
