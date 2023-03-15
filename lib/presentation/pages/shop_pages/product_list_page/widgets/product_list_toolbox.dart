import 'package:ecommerce_cloth/core/enums/sort_type.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProductListToolBox extends StatelessWidget {
  const ProductListToolBox({
    super.key,
    required this.sortButton,
    required this.changeView,
    required this.currentType,
  });

  final ValueChanged sortButton;
  final VoidCallback changeView;
  final SortType currentType;

  static const Map<SortType, String> _typesToString = {
    SortType.novelty: 'Date: new first',
    SortType.priceDESC: 'Price: highest to lowest',
    SortType.priceASC: 'Price: lowest to high',
    SortType.saleFirst: 'Sale: sale items first',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 5))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_rounded),
            label: const Text('Filters'),
          ),
          TextButton.icon(
            onPressed: () {
              buildShowModalBottomSheet(
                context: context,
                header: 'Sort by',
                child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Price: lowest to high',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Price: lowest to high',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Price: lowest to high',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Price: lowest to high',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.swap_vert_rounded),
            label: Text(_typesToString[currentType] ?? ''),
          ),
          IconButton(
            onPressed: changeView,
            icon: const Icon(
              Icons.grid_view_rounded,
            ),
          )
        ],
      ),
    );
  }
}
