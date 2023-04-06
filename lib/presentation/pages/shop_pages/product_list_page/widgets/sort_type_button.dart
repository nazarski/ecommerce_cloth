import 'package:ecommerce_cloth/core/enums/sort_type.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_filter_state/filter_values_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/paging_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortTypeButton extends ConsumerWidget {
  const SortTypeButton({
    super.key,
  });

  static const Map<SortType, String> _typesToString = {
    SortType.novelty: 'Date: new first',
    SortType.priceDESC: 'Price: highest to lowest',
    SortType.priceASC: 'Price: lowest to highest',
    SortType.saleFirst: 'Sale: sale items first',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(filterValuesProvider);
    final currentType = ref.read(filterValuesProvider.notifier).filter.sortType;
    return TextButton.icon(
      onPressed: () {
        buildShowModalBottomSheet(
          context: context,
          header: 'Sort by',
          child: Column(
            children: List.generate(_typesToString.length, (index) {
              final elementType = _typesToString.entries.elementAt(index);
              final isActive = currentType == elementType.key;
              return GestureDetector(
                onTap: () {
                  final newFilter = ref.read(filterValuesProvider.notifier)
                    ..setSortType(sortType: elementType.key);
                  ref
                      .read(pagingControllerProvider.notifier)
                      .newFilerValue(newFilter.filter);
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  padding: const EdgeInsets.only(left: 16),
                  color:
                  isActive ? Theme.of(context).colorScheme.primary : null,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      elementType.value,
                      style: isActive
                          ? TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )
                          : Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
      icon: const Icon(Icons.swap_vert_rounded),
      label: Text(_typesToString[currentType] ?? ''),
    );
  }
}