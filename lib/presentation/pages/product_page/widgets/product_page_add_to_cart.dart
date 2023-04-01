import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'select_size_and_add_to_cart.dart';

class ProductPageAddToCart extends StatelessWidget {
  const ProductPageAddToCart({
    super.key,
    required this.sizes,
  });

  final List<String> sizes;

  @override
  Widget build(BuildContext context) {
    final ifPadding = MediaQuery.of(context).viewPadding.bottom > 0;
    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, -5),
              blurRadius: 10,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
              bottom: ifPadding ? 0 : 12, top: 16, right: 16, left: 16),
          child: ElevatedButton(
            onPressed: () {
              buildShowModalBottomSheet(
                context: context,
                header: 'Select size',
                child: SelectSizeAndAddToCart(
                  sizes: sizes,
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text('ADD TO CART'),
            ),
          ),
        ),
      ),
    );
  }
}