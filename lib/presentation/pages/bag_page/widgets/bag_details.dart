import 'package:ecommerce_cloth/presentation/pages/bag_page/widgets/promo_code_textfield.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/total_amount.dart';
import 'package:ecommerce_cloth/presentation/pages/checkout_page/checkout_page.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BagDetails extends ConsumerWidget {
  const BagDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userCartProvider, (previous, next) {
      if (next.hasValue) {
        final totalAmount = next.value!.fold(0, (value, element) {
          return value + element.quantity * element.product.price;
        });
        ref.read(orderProvider.notifier).setTotalAmount(totalAmount);
      }
    });
    final bagProvider = ref.watch(userCartProvider);
    return bagProvider.when(data: (data) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                    )
                  ]),
              child: const PromoCodeTextField(),
            ),
            const SizedBox(
              height: 28,
            ),
            const TotalAmount(title: 'Total amount',),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(orderProvider.notifier).setCartItems(data);
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(CheckoutPage.routeName);
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('checkout'.toUpperCase()),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      );
    }, error: (error, stackTrace) {
      return Text(error.toString());
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
