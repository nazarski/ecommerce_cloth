import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegateWrap(
                widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 5))
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list_rounded),
                        label: const Text('Filters'),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.swap_vert_rounded),
                        label: const Text('Price: lowest to high'),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.grid_view_rounded))
                    ],
                  ),
                ),
                widgetHeight: 52,
              ),
            ),
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate((context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                  );
                }),
                itemExtent: 140)
          ],
        ),
      ),
    );
  }
}

class ProductTypesList extends StatelessWidget {
  const ProductTypesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background
      ),
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          width: 12,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            // height: 30,
            // width: 100,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Sleeveless',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.surfaceTint),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SliverHeaderDelegateWrap extends SliverPersistentHeaderDelegate {
  const SliverHeaderDelegateWrap(
      {required this.widget, required this.widgetHeight});

  final double widgetHeight;
  final Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => widgetHeight;

  @override
  double get minExtent => widgetHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class TransformingAppBar extends SliverPersistentHeaderDelegate {
  const TransformingAppBar({required this.expandedHeight});

  final double expandedHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;

    return TransformingAppBarContent(progress: progress);
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class TransformingAppBarContent extends StatelessWidget {
  const TransformingAppBarContent({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          elevation: 0,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.lerp(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            const EdgeInsets.only(bottom: 16),
            progress,
          ),
          alignment: Alignment.lerp(
            Alignment.bottomLeft,
            Alignment.bottomCenter,
            progress,
          ),
          child: Text(
            'Women`s tops',
            style: TextStyle.lerp(
              Theme.of(context).textTheme.displayLarge,
              Theme.of(context).textTheme.displaySmall,
              progress,
            ),
          ),
        ),
      ],
    );
  }
}
