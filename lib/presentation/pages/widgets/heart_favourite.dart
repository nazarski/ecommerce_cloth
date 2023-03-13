import 'package:flutter/material.dart';

class HeartFavourite extends StatelessWidget {
  const HeartFavourite({
    super.key,
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 4),
                blurRadius: 5),
          ]),
      child: !active
          ? Icon(
        Icons.favorite_border,
        size: 18,
        color: Theme.of(context).colorScheme.surface,
      )
          : Icon(
        Icons.favorite,
        size: 18,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
