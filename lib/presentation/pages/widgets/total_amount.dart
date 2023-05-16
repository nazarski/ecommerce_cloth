import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalAmount extends ConsumerWidget {
  const TotalAmount({required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderProvider);
    if (order.promoCode == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            '${order.totalAmount}\$',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      );
    }
    final discountedPrice =
    (order.totalAmount * (1 - order.promoCode!.discount / 100)).round();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text.rich(
          TextSpan(style: Theme.of(context).textTheme.displaySmall, children: [
            TextSpan(
              text: '$discountedPrice\$',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const WidgetSpan(
              child: SizedBox(
                width: 12,
              ),
            ),
            TextSpan(
              text: '${order.totalAmount}\$',
              style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 6),
            )
          ]),
        ),
      ],
    );
  }
}
