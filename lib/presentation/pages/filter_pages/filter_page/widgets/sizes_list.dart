import 'package:ecommerce_cloth/presentation/riverpod/receive_filter_values_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizesList extends ConsumerWidget {
  const SizesList({
    super.key,
  });

  static const _listOfSizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', '3XL'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiver = ref.watch(receiveFilterValuesProvider).sizes;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_listOfSizes.length, (index) {
        return _SizeItem(
          size: _listOfSizes[index],
          isActive: receiver.contains(
            _listOfSizes[index],
          ),
          action: () {
            ref
                .read(receiveFilterValuesProvider.notifier)
                .selectSize(_listOfSizes[index]);
          },
        );
      }),
    );
  }
}

class _SizeItem extends StatelessWidget {
  const _SizeItem({
    super.key,
    required this.size,
    required this.isActive,
    required this.action,
  });

  final String size;
  final bool isActive;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).colorScheme.primary : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: isActive
                ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    )
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
