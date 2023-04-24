import 'dart:io';

import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/widgets/favourites_list.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/widgets/favourites_types_list.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/product_list_toolbox.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/sliver_header_delegate_wrap.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/transforming_app_bar.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/favourites_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesPage extends ConsumerStatefulWidget {
  const FavouritesPage({
    Key? key,
  }) : super(key: key);
  static const routeName = 'favourites-page';

  @override
  ConsumerState<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends ConsumerState<FavouritesPage> {
  bool isGrid = false;

  Future<void> _refreshFunction() async {
    final types = ref.refresh(favouritesTypesProvider);
    final value =
        await ref.refresh(favouritesListProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .16;
    final Widget child;
    if (Platform.isIOS) {
      child = CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: TransformingAppBar(
              ifPop: false,
              expandedHeight: MediaQuery.of(context).size.height * .16,
              title: 'Favourites',
            ),
            pinned: true,
          ),
          const SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegateWrap(
              widget: FavouritesTypesList(),
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
                },
                changeSortType: (ProductFilterEntity value) {},
              ),
              widgetHeight: 52,
            ),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: _refreshFunction,
          ),
          FavouritesListWidget(isGrid: isGrid)
        ],
      );
    } else {
      child = RefreshIndicator(
        edgeOffset: height + 84,
        onRefresh: _refreshFunction,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: TransformingAppBar(
                ifPop: false,
                expandedHeight: height,
                title: 'Favourites',
              ),
              pinned: true,
            ),
            const SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegateWrap(
                widget: FavouritesTypesList(),
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
                  },
                  changeSortType: (ProductFilterEntity value) {},
                ),
                widgetHeight: 52,
              ),
            ),
            FavouritesListWidget(isGrid: isGrid)
          ],
        ),
      );
    }
    return SafeArea(
      child: Material(child: child),
    );
  }
}
