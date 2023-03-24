import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/rating_reviews_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/heart_favourite.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/product_details_buttons.dart';
import 'widgets/product_dropdown.dart';
import 'widgets/product_share_app_bar.dart';
import 'widgets/you_may_also_like_widget.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({Key? key, required this.selectedProduct})
      : super(key: key);
  static const routeName = 'product-page';
  final ProductEntity selectedProduct;

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductShareAppBar(
          title:
              '${widget.selectedProduct.brand} ${widget.selectedProduct.name} ${widget.selectedProduct.productType}'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.constrainWidth();
          final height = constraints.constrainHeight();
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: height * .7,
                child: Scrollbar(
                  controller: _controller,
                  child: PageView.builder(
                      padEnds: false,
                      controller: _controller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.selectedProduct.images.length,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return Hero(
                            tag: widget.selectedProduct.id,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Image(
                                width: width,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${StrapiInitialize.endpoint}${widget.selectedProduct.images[i]}'),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.only(
                            right: widget.selectedProduct.images.length - 1 > i
                                ? 12
                                : 0,
                          ),
                          child: Image(
                            width: width,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${StrapiInitialize.endpoint}${widget.selectedProduct.images[i]}'),
                          ),
                        );
                      }),
                ),
              ),
              Padding(
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
                      children: [
                        ProductDropdown(
                          listOfValues: widget
                              .selectedProduct.availableQuantity.keys
                              .toList(),
                          valueType: 'Size',
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        ProductDropdown(
                          listOfValues: widget.selectedProduct.colors,
                          valueType: 'Color',
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const HeartFavourite(active: false),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.selectedProduct.brand,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          '\$${widget.selectedProduct.price}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${widget.selectedProduct.name} ${widget.selectedProduct.colors.first[0].toUpperCase() + widget.selectedProduct.colors.first.substring(1)} ${widget.selectedProduct.productType} ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          RatingReviewPage.routeName,
                          arguments: widget.selectedProduct.rating,
                        );
                      },
                      child: StarsViewWidget(
                        rating: widget.selectedProduct.rating.averageRating,
                        reviews: widget.selectedProduct.rating.totalReviews,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.selectedProduct.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(height: 1.5),
                    )
                  ],
                ),
              ),
              const ProductDetailsButtons(),
              YouMayAlsoLikeWidget(
                product: widget.selectedProduct,
              ),
            ],
          );
        },
      ),
    );
  }
}
