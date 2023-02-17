import 'package:flutter/material.dart';

import 'product_slider_item.dart';

enum ProductSliderType {
  newProducts,
  sale,
  hot,
}

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
    required this.subtitle, required this.type,
  });

  final String subtitle;
  final ProductSliderType type;

  String getTitle() {
    return {
      ProductSliderType.newProducts: 'New',
      ProductSliderType.sale: 'Sale',
      ProductSliderType.hot: 'Hot',
    }[type]!;
  }

  @override
  Widget build(BuildContext context) {
    final String title = getTitle();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .displayLarge,
                    ),
                  Text(
                    subtitle,
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text('View all'))
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 14, bottom: 20),
            itemCount: 10,
            itemBuilder: (context, i) {
              return ProductSliderItem(value: title,);
            },
            separatorBuilder: (_, __) =>
            const SizedBox(
              width: 18,
            ),
          ),
        )
      ],
    );
  }
}