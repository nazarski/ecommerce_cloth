import 'package:ecommerce_cloth/core/utils/helpers/product_helpers.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/heart_favourite.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/product_item_chip.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';

class ProductListListItem extends StatefulWidget {
  const ProductListListItem({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  State<ProductListListItem> createState() => _ProductListListItemState();
}

class _ProductListListItemState extends State<ProductListListItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = getTitle(
      name: widget.product.name,
      brand: widget.product.brand,
      type: widget.product.productType,
    );
    final String chipValue = getChipValue(
      widget.product.additionDate,
      widget.product.sale,
    );
    _animationController.forward();
    return FadeTransition(
      opacity: _animationController,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              height: 112,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 5),
                        blurRadius: 5)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  children: [
                    Image(
                      image: NetworkImage(widget.product.thumbnail),
                      width: MediaQuery.of(context).size.width * .33,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          widget.product.brand,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        StarsViewWidget(
                          rating: widget.product.rating.averageRating,
                          reviews: widget.product.rating.totalReviews,
                        ),
                        Text(
                          '${widget.product.price}\$',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: HeartFavourite(
              systemProductId: widget.product.systemId,
              listOfSizes: widget.product.availableQuantity.keys.toList(),
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
    );
  }
}
