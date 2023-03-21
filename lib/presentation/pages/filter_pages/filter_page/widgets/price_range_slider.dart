import 'package:ecommerce_cloth/presentation/riverpod/receive_filter_values_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PriceRangeSlider extends ConsumerWidget {
  const PriceRangeSlider({
    super.key,
    required this.priceRange,
  });

  final RangeValues priceRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiver = ref.watch(receiveFilterValuesProvider);
    final receiverRange =
        RangeValues(receiver.fromPrice.toDouble(), receiver.toPrice.toDouble());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // if (receiver.fromPrice == 0) ...[
              //   Text('\$${priceRange.start.toInt()}'),
              //   Text('\$${priceRange.end.toInt()}'),
              // ] else ...[
                Text('\$${receiver.fromPrice}'),
                Text('\$${receiver.toPrice}'),
              // ]
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RangeSlider(
              min: priceRange.start,
              max: priceRange.end,
              values: receiverRange,
              onChanged: (RangeValues range) {
                ref.read(receiveFilterValuesProvider.notifier).setRange(range);
              },
            ),
          ),
        ],
      ),
    );
  }
}
