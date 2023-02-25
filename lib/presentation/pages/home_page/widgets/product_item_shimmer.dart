import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductSliderShimmer extends StatelessWidget {
  const ProductSliderShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
            highlightColor: Theme.of(context).colorScheme.background.withOpacity(0.3),
            child: Container(
              height: 184,
              width: 148,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
            highlightColor: Theme.of(context).colorScheme.background.withOpacity(0.3),
            child: Container(
              height: 11,
              width: 64,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
            highlightColor: Theme.of(context).colorScheme.background.withOpacity(0.3),
            child: Container(
              height: 16,
              width: 86,
              color: Colors.white,

            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
            highlightColor: Theme.of(context).colorScheme.background.withOpacity(0.3),
            child: Container(
              height: 14,
              width: 40,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
