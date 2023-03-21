import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage(this.selectedProduct, {Key? key}) : super(key: key);
  static const routeName = 'product-page';
  final ProductEntity selectedProduct;

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(
            '${widget.selectedProduct.brand} ${widget.selectedProduct.name} ${widget.selectedProduct.productType}'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_rounded,
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.constrainWidth();
          final height = constraints.constrainHeight();
          return Column(
            children: [
              SizedBox(
                height: height * .66,
                child: PageView.builder(
                    itemCount: widget.selectedProduct.images.length,
                    // pageSnapping: true,
                    itemBuilder: (context, i) {
                      return Hero(
                        tag: widget.selectedProduct.id,
                        child: Image(
                          fit: BoxFit.cover,
                          width: width,
                          image: NetworkImage(
                              '${StrapiInitialize.endpoint}${widget.selectedProduct.images[i]}'),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    SizesDropdown(
                      listOfSizes: widget.selectedProduct.availableQuantity.keys
                          .toList(),
                    ),
                    SizesDropdown(
                      listOfSizes: widget.selectedProduct.availableQuantity.keys
                          .toList(),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SizesDropdown extends StatelessWidget {
  const SizesDropdown({
    super.key,
    required this.listOfSizes,
  });

  final List<String> listOfSizes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField(
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        hint: Text('Size'),
          items: List.generate(listOfSizes.length, (i) {
        final String size = listOfSizes[i];
        return DropdownMenuItem(
          value: size,
            child: Text(size));
      }), onChanged: (value) {}),
    );
  }
}
