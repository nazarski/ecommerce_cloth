import 'package:flutter/material.dart';

class ReviewsCountIndicator extends StatelessWidget {
  const ReviewsCountIndicator({Key? key, required this.width})
      : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        width: width,
        height: 8,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}