import 'package:flutter/material.dart';

class FilterItemContainer extends StatelessWidget {
  const FilterItemContainer(
      {Key? key, required this.child, required this.title})
      : super(key: key);
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 4),
                blurRadius: 5,
              ),
            ],
          ),
          child: child,
        ),
      ],
    );
  }
}
