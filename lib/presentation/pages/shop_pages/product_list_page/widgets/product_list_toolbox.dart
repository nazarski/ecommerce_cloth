import 'package:ecommerce_cloth/presentation/pages/filter_pages/filter_nest_page.dart';
import 'package:flutter/material.dart';

import 'sort_type_button.dart';

class ProductListToolBox extends StatelessWidget {
  const ProductListToolBox({
    super.key,
    required this.changeView,
    required this.isGrid,
  });

  final VoidCallback changeView;
  final bool isGrid;

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
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(FilterNestPage.routeName);
            },
            icon: const Icon(Icons.filter_list_rounded),
            label: const Text('Filters'),
          ),
          const SortTypeButton(),
          IconButton(
            onPressed: changeView,
            icon: Icon(
              isGrid ? Icons.grid_view_rounded : Icons.list_rounded,
            ),
          )
        ],
      ),
    );
  }
}

