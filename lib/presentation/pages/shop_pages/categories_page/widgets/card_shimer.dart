import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const ShimmerWidget(height: 100,),
              ),
            );
          }),
        ),
      ),
    );
  }
}