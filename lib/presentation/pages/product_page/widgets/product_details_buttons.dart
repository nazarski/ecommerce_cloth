import 'package:flutter/material.dart';

import 'details_item.dart';

class ProductDetailsButtons extends StatelessWidget {
  const ProductDetailsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Divider(
          height: 0,
        ),
        DetailsItem(
          title: 'Item details',
        ),
        Divider(
          height: 0,
        ),
        DetailsItem(
          title: 'Shipping info',
        ),
        Divider(
          height: 0,
        ),
        DetailsItem(
          title: 'Support',
        ),
        Divider(
          height: 0,
        ),
      ],
    );
  }
}
