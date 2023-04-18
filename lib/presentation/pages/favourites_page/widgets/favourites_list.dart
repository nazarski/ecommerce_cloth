import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/widgets/favourites_list_list_item.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/product_item_chip.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritesListWidget extends ConsumerStatefulWidget {
  const FavouritesListWidget({
    super.key,
    required this.isGrid,
  });

  final bool isGrid;

  @override
  ConsumerState<FavouritesListWidget> createState() =>
      _ProductListWidgetState();
}

class _ProductListWidgetState extends ConsumerState<FavouritesListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isGrid) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 280,
            childAspectRatio: 1 / 1.55,
            crossAxisSpacing: 16,
            mainAxisSpacing: 24,
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const FavouritesListGridItem(hero: false,);
            },
            childCount: 10,
          ),
        ),
      );
    }
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        sliver: SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const FavouritesListListItem();
            },
            childCount: 10,
          ),
          itemExtent: 120,
        ));
  }
}

class FavouritesListGridItem extends ConsumerStatefulWidget {
  const FavouritesListGridItem({
    super.key,
    required this.hero,
  });

  final bool hero;

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
    _animationController.forward();
    return FadeTransition(
      opacity: _animationController,
      child: GestureDetector(
        onTap: () {
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
                        child: const Hero(
                          tag: 'tag',
                          child: Image(
                            image: AssetImage('assets/images/men.jpg'),
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
                      ),),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: StarsViewWidget(
                      rating: 5,
                      reviews: 10,
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
                'LIME',
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
                          text: 'Black',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8,),
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
                          text: 'L',
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
                '30\$',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]),
      ),
    );
  }
}
