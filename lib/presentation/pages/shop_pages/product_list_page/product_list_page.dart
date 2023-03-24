import 'package:flutter/material.dart';
import 'widgets/product_list_toolbox.dart';
import 'widgets/product_list_widget.dart';
import 'widgets/product_types_list.dart';
import 'widgets/sliver_header_delegate_wrap.dart';
import '../../widgets/transforming_app_bar.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key, required this.title}) : super(key: key);
  static const routeName = 'product-list-page';
final String title;
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool isGrid = true;

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
                widget: ProductListToolBox(
                  changeView: () {
                    setState(() {
                      isGrid = !isGrid;
                    });
                  }, isGrid: isGrid,
                ),
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
