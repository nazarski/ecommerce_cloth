import 'package:flutter/material.dart';

class StarsRow extends StatelessWidget {
  const StarsRow({
    Key? key,
    required this.numberOfStars,
  }) : super(key: key);
  final int numberOfStars;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(numberOfStars, (index) {
        return const Icon(
          Icons.star_rounded,
          color: Color(0xffFFBA49),
          size: 14,
        );
      }),
    );
  }
}
