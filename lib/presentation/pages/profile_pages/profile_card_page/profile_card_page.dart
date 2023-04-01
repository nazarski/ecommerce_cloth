import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/address_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/order_page/order_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/profile_card_page/widgets/setting_item.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/setting_page/setting_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/user_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCardPage extends ConsumerWidget {
  const ProfileCardPage({Key? key}) : super(key: key);
  static const routeName = 'profile-card-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserInfoEntity> userFromLocal = ref.watch(getUserInfo);
    if (userFromLocal is AsyncLoading) {
      return const CircularProgressIndicator.adaptive();
    } else if (userFromLocal is AsyncError) {
      return Text('Error: ${userFromLocal.error}');
    } else if (userFromLocal is AsyncData) {
      final user = userFromLocal.value;
      return Scaffold(
        appBar: const AppBarSearchBack(
          title: '',
          search: true,
          elevation: false,
          back: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My profile',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: user!.photoUrl.isNotEmpty ? Colors.transparent : Colors.grey,
                        child: user.photoUrl.isNotEmpty
                            ? ClipOval(child: SizedBox(width: 100, height: 50, child: Image.network(user.photoUrl)))
                            : SvgPicture.asset(AppIcons.avatar),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user!.displayName.toString(),
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user.email.toString(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SettingItem(
                      title: 'My orders',
                      subtitle: 'Already have ?? orders',
                      onTap: () {
                        Navigator.of(context).pushNamed(OrderPage.routeName);
                      },
                    ),
                    SettingItem(
                      title: 'Shipping addresses',
                      subtitle: '? addresses',
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pushNamed(AddressNestPage.routeName);
                      },
                    ),
                    SettingItem(
                      title: 'Payment methods',
                      subtitle: 'Visa  **34',
                      onTap: () {},
                    ),
                    SettingItem(
                      title: 'Promo-codes',
                      subtitle: 'You have special promo codes',
                      onTap: () {},
                    ),
                    SettingItem(
                      title: 'My reviews',
                      subtitle: 'Reviews for ?? items',
                      onTap: () {},
                    ),
                    SettingItem(
                      title: 'Settings',
                      subtitle: 'Notifications, password',
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pushNamed(SettingNestPage.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }
}
