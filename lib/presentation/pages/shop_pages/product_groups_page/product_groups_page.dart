import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/product_list_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_categories_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/collect_search_hierarchy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductGroupPage extends ConsumerWidget {
  const ProductGroupPage({
    Key? key,
  }) : super(key: key);
  static const routeName = 'product-group-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String categoryId =
        ref.read(collectSearchHierarchyProvider.notifier).finder.categoryId;
    final productGroups = ref.watch(productGroupsProvider(categoryId));
    return productGroups.when(
      data: (data) => Scaffold(
        appBar: const AppBarSearchBack(
          title: 'Categories',
          search: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Center(
                    child: Text(
                      'view all items'.toUpperCase(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Choose category',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, i) => InkWell(
                  onTap: () {
                    ref
                        .read(collectSearchHierarchyProvider.notifier)
                        .addProductGroup(
                      productGroup: data[i],
                    );
                    final finder = ref
                        .read(collectSearchHierarchyProvider.notifier)
                        .finder;
                    final title =
                        '${finder.attribute[0].toUpperCase()}${finder.attribute.substring(1)}`s ${finder.productGroup.toLowerCase()}';

                    Navigator.of(context).pushNamed(
                      ProductListPage.routeName,
                      arguments: title,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 40),
                    child: Text(
                      data[i],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: data.length,
              ),
            )
          ],
        ),
      ),
      error: (_, __) => const Text('Error'),
      loading: () => const Text('Loading'),
    );
  }
}
