import 'package:flutter/material.dart';

class RedWrapCircleIcon extends StatelessWidget {
  const RedWrapCircleIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
