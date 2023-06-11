import 'package:ecommerce_cloth/core/utils/helpers/product_helpers.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/product_page/product_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/heart_favourite.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/product_item_chip.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';

class ProductSliderItem extends StatelessWidget {
  const ProductSliderItem({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final String title = getTitle(
        name: product.name, brand: product.brand, type: product.productType);
    final chipValue = getChipValue(product.additionDate, product.sale);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(ProductPage.routeName, arguments: product);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: NetworkImage(product.thumbnail),
                    height: 184,
                    width: 148,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 2,
              child: HeartFavourite(
                systemProductId: product.systemId,
                listOfSizes: product.availableQuantity.keys.toList(),
              ),
            ),

            if (chipValue.isNotEmpty)
              Positioned(
                top: 8,
                left: 8,
                child: ProductItemChip(
                  value: chipValue,
                ),
              ),
          ],
        ),
        StarsViewWidget(
          rating: product.rating.averageRating,
          reviews: product.rating.totalReviews,
        ),
        const SizedBox(
          height: 6,
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context, rootNavigator: true)
                .pushNamed(ProductPage.routeName, arguments: product);
          },
          child: Text(
            product.brand,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context, rootNavigator: true)
                .pushNamed(ProductPage.routeName, arguments: product);
          },
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context, rootNavigator: true)
                .pushNamed(ProductPage.routeName, arguments: product);
          },
          child: product.sale.isEmpty
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
        ),
      ],
    );
  }
}
