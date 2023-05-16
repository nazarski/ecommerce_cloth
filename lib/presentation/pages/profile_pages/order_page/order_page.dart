import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/order_page/widgets/tab_menu_item.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/order_page/widgets/tab_view_item.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({Key? key}) : super(key: key);
  static const routeName = 'order-page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage>
    with SingleTickerProviderStateMixin {
  final List<OrderEntity> fakeListDelivered = [];
  final List<OrderEntity> fakeListProcessing = [];
  final List<OrderEntity> fakeListCanceled = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const AppBarSearchBack(
          title: '',
          search: true,
          elevation: false,
          back: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Orders',
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 25),
              SizedBox(
                height: 30,
                child: TabBar(
                  unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                  labelColor: Theme.of(context).colorScheme.onSecondary,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  tabs: const [
                    TabMenuItem(nameTab: 'Delivered'),
                    TabMenuItem(nameTab: 'Processing'),
                    TabMenuItem(nameTab: 'Cancelled'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TabViewItem(
                      listOfOrders: fakeListDelivered,
                    ),
                    TabViewItem(
                      listOfOrders: fakeListProcessing,
                    ),
                    TabViewItem(
                      listOfOrders: fakeListCanceled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
