import 'package:ecommerce_cloth/presentation/pages/shop_pages/widgets/app_bar_back_search.dart';
import 'package:flutter/material.dart';

class ProductGroupPage extends StatelessWidget {
  const ProductGroupPage({
    Key? key,
  }) : super(key: key);
  static const routeName = 'product-group-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSearchBack(
        title: 'Categories',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('view all items'.toUpperCase()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Choose category',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                child: Text(
                  'Sweaters',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: 9,
            ),
          )
        ],
      ),
    );
  }
}
