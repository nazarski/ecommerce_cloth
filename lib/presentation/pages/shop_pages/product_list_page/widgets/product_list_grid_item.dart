import 'package:ecommerce_cloth/core/utils/helpers/product_helpers.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/product_page/product_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/heart_favourite.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/product_item_chip.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListGridItem extends ConsumerStatefulWidget {
  const ProductListGridItem({
    super.key,
    required this.product,
    required this.hero,
  });

  final bool hero;
  final ProductEntity product;

  @override
  ConsumerState<ProductListGridItem> createState() =>
      _ProductListGridItemState();
}

class _ProductListGridItemState extends ConsumerState<ProductListGridItem>
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
    final String title = getTitle(
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
      child: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(ProductPage.routeName, arguments: widget.product);
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: HeroMode(
                        enabled: widget.hero,
                        child: Hero(
                          tag: widget.product.id,
                          child: Image(
                            image: NetworkImage(widget.product.thumbnail),
                            width: double.infinity,
                            height: 184,
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 2,
                      child: HeartFavourite(
                        systemProductId: widget.product.systemId,
                        listOfSizes:
                            widget.product.availableQuantity.keys.toList(),
                      )),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: StarsViewWidget(
                      rating: widget.product.rating.averageRating,
                      reviews: widget.product.rating.totalReviews,
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
              Text(
                widget.product.brand,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '${widget.product.price}\$',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]),
      ),
    );
  }
}
