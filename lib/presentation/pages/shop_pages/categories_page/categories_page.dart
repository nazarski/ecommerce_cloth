import 'package:ecommerce_cloth/presentation/pages/shop_pages/categories_page/widgets/tab_view_categories.dart';
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
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          title: const Text('Categories'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
              ),
            )
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabs: categoryGroups.map((e) {
              return Tab(
                text: '${e[0].toUpperCase()}${e.substring(1)}',
              );
            }).toList(),
          ),
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
