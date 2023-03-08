import 'package:flutter/material.dart';

class ProductListToolBox extends StatelessWidget {
  const ProductListToolBox({
    super.key,
  });

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
            onPressed: () {},
            icon: const Icon(Icons.swap_vert_rounded),
            label: const Text('Price: lowest to high'),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.grid_view_rounded))
        ],
      ),
    );
  }
}
