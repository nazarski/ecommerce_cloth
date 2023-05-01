import 'package:ecommerce_cloth/presentation/pages/bag_page/bag_page.dart';
import 'package:ecommerce_cloth/presentation/pages/favourites_page/favourites_page.dart';
import 'package:ecommerce_cloth/presentation/pages/home_page/home_page.dart';

import 'package:ecommerce_cloth/presentation/pages/profile_pages/profile_nest_page.dart';

import 'package:ecommerce_cloth/presentation/pages/shop_pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'widgets/navigation/app_botom_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = 'main-page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<Widget> _pagesList = [
    HomePage(),
    ShopPage(),
    BagPage(),
    FavouritesPage(),
    ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _currentIndex == 0;
      },
      child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _pagesList,
          ),
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, -5),
                  blurRadius: 8,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: AppBottomNavigation(
                currentIndex: _currentIndex,
                onTap: (i) => setState(() => _currentIndex = i),
              ),
            ),
          )),
    );
  }
}
