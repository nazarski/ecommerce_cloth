import 'package:flutter/material.dart';

class TypeChipWidget extends StatelessWidget {
  const TypeChipWidget({
    super.key,
    required this.isActive,
    required this.type,
  });

  final bool isActive;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onSurfaceVariant,
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          '${type}s',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.surfaceTint),
        ),
      ),
    );
  }
}