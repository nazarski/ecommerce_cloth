import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/core/utils/helpers/product_helpers.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/widgets/remove_from_favourites_button.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritesListListItem extends StatefulWidget {
  const FavouritesListListItem({
    Key? key,
    required this.cartItem,
    required this.onRemove,
    required this.addToCart,
  }) : super(key: key);
  final UserCartItemEntity cartItem;
  final VoidCallback onRemove;
  final VoidCallback addToCart;

  @override
  State<FavouritesListListItem> createState() => _FavouritesListListItemState();
}

class _FavouritesListListItemState extends State<FavouritesListListItem>
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
    final product = widget.cartItem.product;
    final title = getTitle(
      name: product.name,
      brand: product.brand,
      type: product.productType,
    );
    final chipValue = getChipValue(product.additionDate, product.sale);
    _animationController.forward();
    return FadeTransition(
      opacity: _animationController,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.network(
                          product.thumbnail,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.brand,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Color:',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                ),
                                                const WidgetSpan(
                                                  child: SizedBox(
                                                    width: 4,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: product.colors.first,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text('${product.price}\$',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Size:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
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
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      StarsViewWidget(
                                        rating: product.rating.averageRating,
                                        reviews: product.rating.totalReviews,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: RemoveFromFavouritesButton(
                action: widget.onRemove,
              ),
            ),
            Positioned(
              bottom: 0,
              right: -10,
              child: ElevatedButton(
                onPressed: widget.addToCart,
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
          ],
        ),
      ),
    );
  }
}
