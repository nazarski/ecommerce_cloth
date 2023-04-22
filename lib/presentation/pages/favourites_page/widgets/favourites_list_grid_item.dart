import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/product_item_chip.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritesListGridItem extends ConsumerStatefulWidget {
  const FavouritesListGridItem({required this.cartItem,
    super.key,
    required this.hero,
  });

  final bool hero;
final UserCartItemEntity cartItem;
  @override
  ConsumerState<FavouritesListGridItem> createState() =>
      _ProductListGridItemState();
}

class _ProductListGridItemState extends ConsumerState<FavouritesListGridItem>
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

  final String title = 'Shirt';
  final String chipValue = '';

  @override
  Widget build(BuildContext context) {
    final product = widget.cartItem.product;
    _animationController.forward();
    return FadeTransition(
      opacity: _animationController,
      child: GestureDetector(
        onTap: () {},
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
                        enabled: false,
                        child: Hero(
                          tag: 'tag',
                          child: Image(
                            image: NetworkImage(product.thumbnail),
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
                    right: -10,
                    bottom: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          CircleBorder(),
                        ),
                      ),
                      child: SvgPicture.asset(
                        AppIcons.bagFilled,
                        height: 16,
                        width: 16,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: StarsViewWidget(
                      rating: product.rating.averageRating,
                      reviews: product.rating.totalReviews,
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
                product.brand,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Color: ',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            width: 4,
                          ),
                        ),
                        TextSpan(
                          text:  product.colors.first,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Size:',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            width: 4,
                          ),
                        ),
                        TextSpan(
                          text: widget.cartItem.size,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                '${product.price}\$',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]),
      ),
    );
  }
}