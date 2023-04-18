import 'package:flutter/material.dart';

import '../product_page/widgets/details_item.dart';

class SelectSizeSheet extends StatelessWidget {
  const SelectSizeSheet({
    super.key,
    required this.sizes,
    required this.onPressed,
    required this.buttonText,
  });

  final List<String> sizes;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 22,
          runSpacing: 16,
          children: List.generate(sizes.length, (index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                width: 100,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      width: 0.8, color: Theme.of(context).colorScheme.surface),
                ),
                child: Center(
                  child: Text(
                    sizes[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(
          height: 24,
        ),
        const Divider(
          height: 0,
        ),
        const DetailsItem(
          title: 'Size info',
        ),
        const Divider(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(buttonText.toUpperCase()),
              ),
            ),
          ),
        )
      ],
    );
  }
}
