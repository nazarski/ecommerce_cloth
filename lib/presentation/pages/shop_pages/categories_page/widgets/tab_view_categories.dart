import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page/widgets/card_shimer.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page/widgets/category_card.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page/widgets/sale_card.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            // NewCard(
            //   attribute: categoryGroup,
            // ),
            const SizedBox(
              height: 8,
            ),
            ...List.generate(data.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CategoryCard(
                  categoryId: data[index].categoryId,
                  categoryTitle: data[index].categoryTitle,
                  imageLink: data[index].categoryImage,
                  attribute: categoryGroup,
                ),
              );
            }),
          ],
        ),
      ),
      error: (_, __) => const Text('Error'),
      loading: () => const CardShimmer(),
    );
  }
}
