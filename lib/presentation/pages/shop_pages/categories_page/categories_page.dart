import 'package:ecommerce_cloth/core/resources/app_colors.dart';
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
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text('Categories'),
              floating: true,
              pinned: true,
              snap: false,
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                  },
                ),
              ],
              bottom: TabBar(
                indicatorColor: AppColorsLight.primary,
                tabs: categoryGroups
                    .map((e) => Tab(text: e.capitalize()))
                    .toList(),
              ),
            ),
          ],
          body: TabBarView(
            children: categoryGroups
                .map(
                  (e) => TabViewCategories(categoryGroup: e),
            )
                .toList(),
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
