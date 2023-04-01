import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:flutter/material.dart';

import 'widgets/pictures_view.dart';
import 'widgets/product_details.dart';
import 'widgets/product_details_buttons.dart';
import 'widgets/product_page_add_to_cart.dart';
import 'widgets/product_share_app_bar.dart';
import 'widgets/you_may_also_like_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.selectedProduct})
      : super(key: key);
  static const routeName = 'product-page';
  final ProductEntity selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductShareAppBar(
          title:
              '${selectedProduct.brand} ${selectedProduct.name} ${selectedProduct.productType}'),
      bottomNavigationBar: ProductPageAddToCart(
        sizes: selectedProduct.availableQuantity.keys.toList(),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          PicturesView(
            images: selectedProduct.images,
            productId: selectedProduct.id,
          ),
          ProductDetails(selectedProduct: selectedProduct),
          const ProductDetailsButtons(),
          YouMayAlsoLikeWidget(
            product: selectedProduct,
          ),
        ],
      ),
    );
  }
}


