import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class PromoCodeItem extends StatelessWidget {
  const PromoCodeItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.daysLeft,
    required this.buttonApply,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String imageUrl;
  final String daysLeft;
  final bool buttonApply;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$daysLeft days remaining',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColorsLight.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buttonApply ? ElevatedButton(
                      onPressed: () {},
                      child: const Center(child: Text('Apply')),
                    ) : const SizedBox.shrink()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
