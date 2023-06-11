import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    super.key,
    required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
