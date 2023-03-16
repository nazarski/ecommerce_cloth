import 'package:ecommerce_cloth/core/utils/helpers/product_helpers.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/product_item_chip.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';

class ProductSliderItem extends StatelessWidget {
  const ProductSliderItem({
    super.key,
    required this.value,
    required this.product,
  });

  final String value;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final String title = getTitle(
        name: product.name, brand: product.brand, type: product.productType);
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
              child: Image(
                image: NetworkImage(
                    '${StrapiInitialize.endpoint}${product.thumbnail}'),
                height: 184,
                width: 148,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: ProductItemChip(
                value: value,
              ),
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
              ),
            )
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          product.brand,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 4,
        ),
        product.sale.isEmpty
            ? Text(
                '${product.price}\u20B4',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '1500\u20B4',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 4,
                    ),
                  ),
                  TextSpan(
                      text: '1400\u20B4',
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
