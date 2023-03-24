import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransformingAppBarContent extends ConsumerWidget {
  const TransformingAppBarContent({
    super.key,
    required this.progress,
    required this.title,
  });

  final double progress;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          elevation: 0,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.lerp(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            const EdgeInsets.only(bottom: 16),
            progress,
          ),
          alignment: Alignment.lerp(
            Alignment.bottomLeft,
            Alignment.bottomCenter,
            progress,
          ),
          child: Text(
            title,
            style: TextStyle.lerp(
              Theme.of(context).textTheme.displayLarge,
              Theme.of(context).textTheme.displaySmall,
              progress,
            ),
          ),
        ),
      ],
    );
  }
}
