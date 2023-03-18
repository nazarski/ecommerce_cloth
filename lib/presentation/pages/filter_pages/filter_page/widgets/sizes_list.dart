import 'package:flutter/material.dart';

class SizesList extends StatelessWidget {
  const SizesList({
    super.key,
  });

  static const _listOfSizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _listOfSizes.map((e) {
        return Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: Center(
            child: Text(
              e,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      }).toList(),
    );
  }
}