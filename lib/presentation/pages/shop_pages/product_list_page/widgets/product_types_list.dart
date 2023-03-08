import 'package:flutter/material.dart';

class ProductTypesList extends StatelessWidget {
  const ProductTypesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background
      ),
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          width: 12,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // height: 30,
            // width: 100,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Sleeveless',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.surfaceTint),
              ),
            ),
          );
        },
      ),
    );
  }
}
