import 'package:ecommerce_cloth/presentation/pages/home_page/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/product_list_toolbox.dart';
import 'widgets/product_types_list.dart';
import 'widgets/sliver_header_delegate_wrap.dart';
import 'widgets/transforming_app_bar.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);
  static const routeName = 'product-list-page';

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            // CupertinoSliverNavigationBar(
            //   border: Border.fromBorderSide(BorderSide.none),
            //   padding: EdgeInsetsDirectional.zero,
            //   largeTitle: Text(
            //     'Women`s tops',
            //   ),
            //   stretch: true,
            //   leading: IconButton(
            //     iconSize: 24,
            //     onPressed: () {},
            //     icon: Icon(Icons.arrow_back_ios_new_rounded),
            //   ),
            //   backgroundColor: Theme.of(context).colorScheme.background,
            //   trailing: IconButton(
            //     iconSize: 24,
            //     onPressed: () {},
            //     icon: Icon(Icons.search),
            //   ),
            // ),
            SliverPersistentHeader(
              delegate: TransformingAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * .16),
              pinned: true,
            ),
            const SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegateWrap(
                widget: ProductTypesList(),
                widgetHeight: 30,
              ),
            ),
            const SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegateWrap(
                widget: ProductListToolBox(),
                widgetHeight: 52,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver:
              ProductListGridView(),
              // ProductListListView(),
            )
          ],
        ),
      ),
    );
  }
}

class ProductListGridView extends StatelessWidget {
  const ProductListGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 204,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      image: AssetImage('assets/images/men.jpg'),
                      width: double.infinity,
                      height: 184,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).colorScheme.onPrimary,
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
                      ))
                ],
              ),
              Text(
                'Pullover',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Mango',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '650',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]);
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 260,
        childAspectRatio: 1 / 1.55,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
        crossAxisCount: 2,
      ),
    );
  }
}

class ProductListListView extends StatelessWidget {
  const ProductListListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Stack(
              children: [
                Container(
                  height: 112,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 5),
                            blurRadius: 5)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/men.jpg'),
                          width: MediaQuery.of(context).size.width * .33,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Pullover',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              'Mango',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            StarsViewWidget(rating: 4, reviews: 12),
                            Text(
                              '650\$',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: HeartFavourite(
                    active: false,
                  ),
                ),
              ],
            ),
          );
        }),
        itemExtent: 140);
  }
}

class HeartFavourite extends StatelessWidget {
  const HeartFavourite({
    super.key,
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 4),
                blurRadius: 5),
          ]),
      child: !active
          ? Icon(
              Icons.favorite_border,
              size: 18,
              color: Theme.of(context).colorScheme.surface,
            )
          : Icon(
              Icons.favorite,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
    );
  }
}
