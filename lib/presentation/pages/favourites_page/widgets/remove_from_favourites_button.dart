import 'package:flutter/material.dart';

class RemoveFromFavouritesButton extends StatelessWidget {
  const RemoveFromFavouritesButton({
    super.key,
    required this.action,
  });

  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      height: 0,
      padding: const EdgeInsets.all(2),
      shape: const CircleBorder(),
      onPressed: action,
      child: Icon(
        Icons.close,
        color: Theme.of(context).colorScheme.surface,
        size: 20,
      ),
    );
  }
}
