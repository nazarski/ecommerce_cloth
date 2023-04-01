import 'package:flutter/material.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({
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
