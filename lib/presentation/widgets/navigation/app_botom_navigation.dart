import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.home),
            activeIcon: SvgPicture.asset(AppIcons.homeFilled),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.shop),
          activeIcon: SvgPicture.asset(AppIcons.shopFilled),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.bag),
            activeIcon: SvgPicture.asset(AppIcons.bagFilled),
            label: 'Bag'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.heart),
            activeIcon: SvgPicture.asset(AppIcons.heartFilled),
            label: 'Favourites'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.profile),
            activeIcon: SvgPicture.asset(AppIcons.profileFilled),
            label: 'Profile'),
      ],
    );
  }
}