import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/product_type_find_entity/product_type_find_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_groups_page/product_groups_page.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_categories_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/collect_search_hierarchy_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/new_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryCard extends ConsumerWidget {
  const CategoryCard({
    Key? key,
    required this.categoryTitle,
    required this.imageLink,
    required this.categoryId,
    required this.attribute,
  }) : super(key: key);
  final String categoryTitle;
  final String categoryId;
  final String imageLink;
  final String attribute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(collectSearchHierarchyProvider.notifier).addCategoryId(
              categoryId: categoryId,
            );
        ref.read(collectSearchHierarchyProvider.notifier).addAttribute(
              attribute: attribute,
            );
        Navigator.of(context).pushNamed(
          ProductGroupPage.routeName,
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 5),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  categoryTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(8)),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage('${StrapiInitialize.endpoint}$imageLink'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
