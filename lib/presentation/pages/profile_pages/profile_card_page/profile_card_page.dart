import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/profile_card_page/widgets/setting_item.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/app_bars/app_bar_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/user_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        appBar: const AppBarSearch(),
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
                        radius: 40,
                        backgroundColor: user?.photoUrl != null ? Colors.transparent : Colors.grey,
                        backgroundImage: user?.photoUrl != null ? NetworkImage(user!.photoUrl) : null,
                      ),
                      const SizedBox(width: 16),
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
                      onTap: () {},
                    ),
                    SettingItem(
                      title: 'Shipping addresses',
                      subtitle: '? addresses',
                      onTap: () {},
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
                      onTap: () {},
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
