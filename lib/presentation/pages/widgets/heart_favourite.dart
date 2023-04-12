import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeartFavourite extends ConsumerWidget {
  const HeartFavourite({
    required this.systemProductId,
    super.key,
  });

  final int systemProductId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ifActive = ref.watch(userInfoProvider).favorites.contains(systemProductId);
    return GestureDetector(
      onTap: () {
        ref
            .read(userInfoProvider.notifier)
            .addToFavourites(systemProductId: systemProductId);
      },
      child: Container(
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
        child: !ifActive
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
      ),
    );
  }
}
