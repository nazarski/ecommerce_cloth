import 'package:ecommerce_cloth/presentation/pages/filter_pages/brands_page/brands_list_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/available_filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/color_list.dart';
import 'widgets/filter_item_container.dart';
import 'widgets/price_range_slider.dart';
import 'widgets/sizes_list.dart';

class FiltersPage extends ConsumerWidget {
  const FiltersPage({Key? key}) : super(key: key);
  static const routeName = 'filters-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(availableFiltersProvider);
    return filters.when(
      data: (data) => Scaffold(
        appBar: AppBarSearchBack(
          root: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          search: false,
          title: 'Filter',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterItemContainer(
              title: 'Price range',
              child: PriceRangeSlider(
                priceRange: data.priceRange,
              ),
            ),
            FilterItemContainer(
              title: 'Colors',
              child: ColorList(
                colors: data.colors,
              ),
            ),
            const FilterItemContainer(
              title: 'Sizes',
              child: SizesList(),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BrandsListPage.routeName,
                );
              },
              child: ListTile(
                title: Text(
                  'Brands',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  'Puma Puma Puma Puma Puma Puma Puma Puma Puma Puma Puma ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
