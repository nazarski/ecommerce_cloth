import 'package:ecommerce_cloth/core/enums/sort_type.dart';
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
          PopupMenuButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            itemBuilder: (context) => _typesToString.entries.map((e) {
              return PopupMenuItem(value: e.key, child: Text(e.value));
            }).toList(),
            child: Row(
              children: [
                const Icon(Icons.swap_vert_rounded),
                Text(
                  _typesToString[currentType] ?? '',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: changeView, icon: const Icon(Icons.grid_view_rounded))
        ],
      ),
    );
  }
}
