import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
      highlightColor: Theme.of(context).colorScheme.background.withOpacity(0.3),
      child: Container(
        height: height,
        width: width ?? double.infinity,
        color: Colors.white,
      ),
    );
  }
}
