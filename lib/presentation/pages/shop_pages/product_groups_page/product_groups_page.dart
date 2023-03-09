import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/product_list_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/widgets/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_categories_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductGroupPage extends ConsumerWidget {
  const ProductGroupPage({
    Key? key,
  }) : super(key: key);
  static const routeName = 'product-group-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productGroups = ref.watch(productGroupsProvider);
    return productGroups.when(
      data: (data) => Scaffold(
        appBar: const AppBarSearchBack(
          title: 'Categories',
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
                    ref.read(productTypesProvider.notifier).selectProductGroup(
                          productGroup: data[i],
                        );
                    Navigator.of(context).pushNamed(ProductListPage.routeName);
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
