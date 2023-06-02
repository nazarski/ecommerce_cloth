import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page/widgets/tab_view_categories.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  static const routeName = 'categories-page';
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  static const categoryGroups = ['women', 'men', 'kids'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryGroups.length,
      child: Scaffold(
        appBar: const AppBarSearchBack(
          title: '',
          search: true,
          elevation: false,
          back: false,
          canPop: true,
        ),
        body: TabBarView(
          children: categoryGroups
              .map(
                (e) => TabViewCategories(categoryGroup: e),
              )
              .toList(),
        ),
      ),
    );
  }
}
