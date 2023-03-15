import 'package:ecommerce_cloth/core/utils/helpers/product_helpers.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';

class ProductListGridItem extends StatefulWidget {
  const ProductListGridItem({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  State<ProductListGridItem> createState() => _ProductListGridItemState();
}

class _ProductListGridItemState extends State<ProductListGridItem>
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
    _animationController.forward();
    return FadeTransition(
      opacity: _animationController,
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
                    child: Image(
                      image: NetworkImage(
                          '${StrapiInitialize.endpoint}${widget.product.thumbnail}'),
                      width: double.infinity,
                      height: 184,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
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
    );
  }
}
