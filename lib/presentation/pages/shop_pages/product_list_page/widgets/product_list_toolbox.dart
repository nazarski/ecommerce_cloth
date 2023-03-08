import 'package:flutter/material.dart';

class ProductListToolBox extends StatelessWidget {
  const ProductListToolBox({
    super.key,
    required this.sortButton,
    required this.changeView,
  });

  final ValueChanged sortButton;
  final VoidCallback changeView;

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
              child: Row(
                children: [
                  const Icon(Icons.swap_vert_rounded),
                  const Text(
                    'Price: lowest to high',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Price: lowest to high')),
                    PopupMenuItem(child: Text('Price: highest to lowest')),
                    PopupMenuItem(child: Text('Date: new first')),
                    PopupMenuItem(child: Text('Sale: sale items first')),
                  ]),
          // TextButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.swap_vert_rounded),
          //   label: const Text('Price: lowest to high'),
          // ),
          IconButton(
              onPressed: changeView, icon: const Icon(Icons.grid_view_rounded))
        ],
      ),
    );
  }
}
