import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class ProductShimmerGrid extends StatelessWidget {
  const ProductShimmerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(4, (_) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox(
              height: 260,
              child: Row(
                children: const [
                  Expanded(child: _ShimmerGridItem()),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(child: _ShimmerGridItem()),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ShimmerGridItem extends StatelessWidget {
  const _ShimmerGridItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const ShimmerWidget(
            height: 180,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const ShimmerWidget(
            height: 10,
            width: 72,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const ShimmerWidget(
            height: 10,
            width: 16,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const ShimmerWidget(
            height: 12,
            width: 96,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const ShimmerWidget(
            height: 12,
            width: 32,
          ),
        ),
      ],
    );
  }
}
