import 'package:flutter/material.dart';

class ColorLabel extends StatelessWidget {
  const ColorLabel({
    super.key,
    required this.color,
  });

  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: Theme.of(context).colorScheme.surface, width: 0.8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
      child: Row(
        children: [
          Text(
            'Color:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            color[0].toUpperCase() + color.substring(1),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}