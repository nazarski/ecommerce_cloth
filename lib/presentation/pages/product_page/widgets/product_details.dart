import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/heart_favourite.dart';
import 'package:flutter/material.dart';

import 'color_label.dart';
import 'go_to_reviews_button.dart';
import 'sizes_selector_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.selectedProduct,
  });

  final ProductEntity selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizesSelectorButton(
                    sizes: selectedProduct.availableQuantity.keys.toList(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ColorLabel(color: selectedProduct.colors.first),
                ],
              ),
              HeartFavourite(
                systemProductId: selectedProduct.systemId, listOfSizes: selectedProduct.availableQuantity.keys.toList(),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedProduct.brand,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '\$${selectedProduct.price}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${selectedProduct.name} ${selectedProduct.colors.first[0].toUpperCase() + selectedProduct.colors.first.substring(1)} ${selectedProduct.productType} ',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 4,
          ),
          GoToReviewsButton(
            systemId: selectedProduct.systemId,
            rating: selectedProduct.rating,
            productId: selectedProduct.id,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            selectedProduct.description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
          )
        ],
      ),
    );
  }
}
