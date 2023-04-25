import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/select_size_sheet.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPageAddToCart extends ConsumerWidget {
  const ProductPageAddToCart({
    required this.systemProductId,
    super.key,
    required this.sizes,
  });

  final List<String> sizes;
  final int systemProductId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            bottom: ifPadding ? 0 : 12,
            top: 16,
            right: 16,
            left: 16,
          ),
          child: ElevatedButton(
            onPressed: () {
              buildShowModalBottomSheet(
                context: context,
                header: 'Select size',
                child: SelectSizeSheet(
                  onPressed: (String size) {
                    ref.read(userCartProvider.notifier).addCartItem(
                          systemProductId: systemProductId,
                          size: size,
                        );
                    Navigator.pop(context);
                  },
                  buttonText: 'add to cart',
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
