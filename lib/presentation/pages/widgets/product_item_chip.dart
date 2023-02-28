import 'package:flutter/material.dart';

class ProductItemChip extends StatelessWidget {
  const ProductItemChip({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: value.toLowerCase() == 'new'
            ? Theme.of(context).colorScheme.onSurfaceVariant
            : Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        value.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
