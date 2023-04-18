import 'package:ecommerce_cloth/presentation/pages/widgets/type_chip_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_filter_state/available_filters_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_filter_state/filter_values_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/paging_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductTypeChip extends ConsumerWidget {
  const ProductTypeChip({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterValuesProvider);
    final isActive =
        filter.productTypes.length == 1 && filter.productTypes.first == type;
    return InkWell(
      onTap: isActive
          ? null
          : () {
        final filter = ref.read(filterValuesProvider.notifier)
          ..setProductTypes(productTypes: [type]);
        ref
            .read(pagingControllerProvider.notifier)
            .newFilerValue(filter.filter);
        ref
            .read(availableFiltersProvider.notifier)
            .getAvailableFilters([type]);
      },
      child: TypeChipWidget(isActive: isActive, type: type),
    );
  }
}
