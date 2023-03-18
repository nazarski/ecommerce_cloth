import 'package:ecommerce_cloth/domain/entities/color_entity/color_entity.dart';
import 'package:ecommerce_cloth/presentation/riverpod/receive_filter_values_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorList extends ConsumerWidget {
  const ColorList({
    super.key,
    required this.colors,
  });

  final List<ColorEntity> colors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiver = ref.watch(receiveFilterValuesProvider);
    return SizedBox(
      height: 32,
      child: ListView.separated(
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              ref.read(receiveFilterValuesProvider.notifier).selectColor(
                    colors[i].colorString,
                  );
            },
            child: _ColorItem(
              isActive: receiver.colors.contains(colors[i].colorString),
              color: colors[i],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 12,
        ),
        itemCount: colors.length,
        padding: const EdgeInsets.only(
          left: 16,
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });

  final bool isActive;
  final ColorEntity color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isActive
            ? Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              )
            : null,
      ),
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: color.colorValue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
