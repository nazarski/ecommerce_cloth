import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_cloth/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import 'widgets/navigation/app_botom_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,
      routes: const [
        HomeRoute(),
        ShopRoute(),
        BagRoute(),
        FavouritesRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return DecoratedBox(
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
              currentIndex: tabsRouter.activeIndex,
              onTap: (i) => tabsRouter.setActiveIndex(i),
            ),
          ),
        );
      },
    );
  }
}
