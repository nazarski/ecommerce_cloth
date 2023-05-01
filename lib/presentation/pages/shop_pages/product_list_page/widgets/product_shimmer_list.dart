import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class ProductShimmerList extends StatelessWidget {
  const ProductShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const ShimmerWidget(
                height: 120,
              ),
            ),
          );
        }),
      ),
    );
  }
}
