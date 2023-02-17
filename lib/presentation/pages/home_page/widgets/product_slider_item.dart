import 'package:ecommerce_cloth/presentation/widgets/product_item_chip.dart';
import 'package:flutter/material.dart';

import 'star_view_widget.dart';

class ProductSliderItem extends StatelessWidget {
  const ProductSliderItem({
    super.key, required this.value,
  });
final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            const SizedBox(
              height: 204,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const Image(
                image: NetworkImage(
                    'https://media.boohoo.com/i/boohoo/pzz67541_navy_xl?w=900&qlt=default&fmt.jpg'),
                height: 184,
                width: 148,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: ProductItemChip(value: value,),
            ),
            Positioned(
              right: 0,
              bottom: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onPrimary,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 4),
                          blurRadius: 4),
                    ]),
                child: Icon(
                  Icons.favorite_border,
                  size: 18,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
            const Positioned(
                left: 0,
                bottom: 0,
                child: StarsViewWidget(
                  rating: 4,
                  reviews: 10,
                ))
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          'Dorothy Perkins',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Checkered skirt',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 4,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '1500₴',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough
              ),),
            const WidgetSpan(child: SizedBox(width: 4,),),
            TextSpan(
                text: '1400₴',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ))
          ]),
        ),
      ],
    );
  }
}
