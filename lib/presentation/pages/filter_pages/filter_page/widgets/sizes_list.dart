import 'package:ecommerce_cloth/presentation/pages/filter_pages/filter_page/widgets/size_item.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_filter_state/receive_filter_values_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizesList extends ConsumerWidget {
  const SizesList( {required this.listOfSizes,
    super.key,
  });

final List<String> listOfSizes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiver = ref.watch(receiveFilterValuesProvider).sizes;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(listOfSizes.length, (index) {
        return SizeItem(
          size: listOfSizes[index],
          isActive: receiver.contains(
            listOfSizes[index],
          ),
          action: () {
            ref
                .read(receiveFilterValuesProvider.notifier)
                .selectSize(listOfSizes[index]);
          },
        );
      }),
    );
  }
}


