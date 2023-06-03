import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/address_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/payment_pages/payments_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/my_reviews_page/my_reviews_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/order_page/order_page.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/profile_card_page/widgets/setting_item.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/setting_page/setting_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_bank_state/manage_bank_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_list_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/product_reviews_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/adresses_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../promocodes_page/promocodes_page.dart';

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
          canPop: false,
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: user!.photoUrl.isNotEmpty
                            ? Image.network(
                                StrapiInitialize.endpoint + user.photoUrl,
                                alignment: Alignment.topCenter,
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              )
                            : SvgPicture.asset(
                                AppIcons.avatar,
                                width: 64,
                                height: 64,
                              ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.displayName.toString(),
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
                    Consumer(builder: (context, ref, child){
                      final listOfOrders = ref.watch(allOrderProviders);
                      return listOfOrders.when(data: (data) {
                        if(data.isEmpty) {
                          return SettingItem(
                            title: 'My orders',
                            subtitle: 'Already doesn\'t have orders',
                            onTap: () {
                              Navigator.of(context).pushNamed(OrderPage.routeName);
                            },
                          );
                        }
                        final int length = data.length;
                        return SettingItem(
                          title: 'My orders',
                          subtitle: 'Already have $length orders',
                          onTap: () {
                            Navigator.of(context).pushNamed(OrderPage.routeName);
                          },
                        );
                      }, error: (error, stackTrace)
                      {
                        return SettingItem(
                          title: 'My orders',
                          subtitle: 'Already doesn\'t have orders',
                          onTap: () {
                            Navigator.of(context).pushNamed(OrderPage.routeName);
                          },
                        );
                      }, loading: () {
                        return SettingItem(
                          title: 'My orders',
                          subtitle: 'loading...',
                          onTap: () {
                            Navigator.of(context).pushNamed(OrderPage.routeName);
                          },
                        );
                      });
                    }),
                    Consumer(builder: (context, ref, child) {
                      final listOfAddresses = ref.watch(getAllUserAddressesProvider);
                      return listOfAddresses.when(data: (data) {
                        if(data.isEmpty) {
                           return SettingItem(
                            title: 'Shipping addresses',
                            subtitle: 'Add a new address',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(AddressNestPage.routeName);
                            },
                          );

                        }
                        final int length = data.length;
                        return SettingItem(
                          title: 'Shipping addresses',
                          subtitle: '$length addresses',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(AddressNestPage.routeName);
                          },
                        );
                      }, error: (error, stackTrace) {
                        return SettingItem(
                          title: 'Shipping addresses',
                          subtitle: '0 addresses',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(AddressNestPage.routeName);
                          },
                        );
                      }, loading: (){
                        return SettingItem(
                          title: 'Shipping addresses',
                          subtitle: 'loading...',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(AddressNestPage.routeName);
                          },
                        );
                      });
                    }),
                    Consumer(builder: (context, ref, child) {
                      final defaultCard = ref.watch(bankCardsProvider);
                      return defaultCard.when(data: (data) {
                        if (data.isEmpty) {
                          return SettingItem(
                            title: 'Payment methods',
                            subtitle: 'Add a new card',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(PaymentsNestPage.routeName);
                            },
                          );
                        }
                        final defaultCard = data.first;
                        return SettingItem(
                          title: 'Payment methods',
                          subtitle:
                              'Default card **${defaultCard.cardNumber.toString().substring(defaultCard.cardNumber.toString().length - 2)}',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(PaymentsNestPage.routeName);
                          },
                        );
                      }, error: (error, stackTrace) {
                        return SettingItem(
                          title: 'Payment methods',
                          subtitle: '',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(PaymentsNestPage.routeName);
                          },
                        );
                      }, loading: () {
                        return SettingItem(
                          title: 'Payment methods',
                          subtitle: 'loading...',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(PaymentsNestPage.routeName);
                          },
                        );
                      });
                    }),
                    SettingItem(
                        title: 'Promo-codes',
                        subtitle: 'You have special promo codes',
                        onTap: () {
                          buildShowModalBottomSheet(
                            context: context,
                            child: const PromoCodesBodyPage(),
                            header: 'Your Promo Codes',
                          );
                        }),
                    Consumer(builder: (context, ref, child) {
                      final reviews = ref.watch(userReviewsProvider);
                      return reviews.when(data: (data) {
                        if(data.isEmpty) {
                          return SettingItem(
                            title: 'My reviews',
                            subtitle: 'You need to add review',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(MyReviewsNestPage.routeName);
                            },
                          );
                        }
                        final int length = data.length;
                        return SettingItem(
                          title: 'My reviews',
                          subtitle: 'Reviews for $length items',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(MyReviewsNestPage.routeName);
                          },
                        );
                      }, error: (error, stackTrace) {
                        return SettingItem(
                          title: 'My reviews',
                          subtitle: 'Reviews for 0 items',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(MyReviewsNestPage.routeName);
                          },
                        );
                      }, loading: () {
                        return SettingItem(
                          title: 'My reviews',
                          subtitle: 'loading...',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(MyReviewsNestPage.routeName);
                          },
                        );
                      });

                    }),

                    SettingItem(
                      title: 'Settings',
                      subtitle: 'Notifications, password',
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(SettingNestPage.routeName);
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
