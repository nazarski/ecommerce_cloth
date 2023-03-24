
import 'package:flutter/material.dart';

class StarsViewWidget extends StatelessWidget {
  const StarsViewWidget({
    Key? key,
    required this.rating,
    this.reviews,
  }) : super(key: key);
  final double rating;
  final int? reviews;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(5, (index) {
        if (rating.floor() >= index + 1) {
          return const Icon(
            Icons.star_rounded,
            color: Color(0xffFFBA49),
            size: 14,
          );
        }
        return Icon(
          Icons.star_border_rounded,
          color: Theme.of(context).colorScheme.surface,
          size: 14,
        );
      }),
      if(reviews != null)
      Text(
        '($reviews)',
        style: Theme.of(context).textTheme.labelMedium,
      )
    ]);
  }
}