import 'package:ecommerce_cloth/presentation/pages/bag_page/widgets/bag_details.dart';
import 'package:ecommerce_cloth/presentation/pages/bag_page/widgets/cart_list.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';
import 'package:flutter/material.dart';

class BagPage extends StatelessWidget {
  const BagPage({Key? key}) : super(key: key);
  static const routeName = 'bag-page';
  final String _myBag = 'My Bag';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Material(
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      delegate: TransformingAppBar(
                        ifPop: false,
                        expandedHeight: height * .16,
                        title: _myBag,
                      ),
                      pinned: true,
                    ),
                    const SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      sliver: CartList(),
                    ),
                  ],
                ),
              ),
              const BagDetails(),
            ],
          ),
        ),
      ),
    );
  }
}




