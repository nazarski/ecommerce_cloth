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
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              'Price range',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          FilterItemContainer(
            child: PriceRangeSlider(
              priceRange: data.priceRange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              'Colors',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
           FilterItemContainer(
            child: ColorList(colors: data.colors,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              'Sizes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const FilterItemContainer(
            child: SizesList(),
          ),
          GestureDetector(
            onTap: () {
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
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
