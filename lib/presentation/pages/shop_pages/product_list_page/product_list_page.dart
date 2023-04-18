import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/product_list_toolbox.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/product_list_widget.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/product_types_list.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/sliver_header_delegate_wrap.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/paging_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({Key? key, required this.title}) : super(key: key);
  static const routeName = 'product-list-page';
  final String title;

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  bool isGrid = false;

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
                ifPop: true,
                expandedHeight: MediaQuery.of(context).size.height * .16,
                title: widget.title,
              ),
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
                widget: ProductListToolBox(changeView: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                }, changeSortType: (ProductFilterEntity value) {
                  ref
                      .read(pagingControllerProvider.notifier)
                      .newFilerValue(value);
                }),
                widgetHeight: 52,
              ),
            ),
            ProductListWidget(isGrid: isGrid)
          ],
        ),
      ),
    );
  }
}
