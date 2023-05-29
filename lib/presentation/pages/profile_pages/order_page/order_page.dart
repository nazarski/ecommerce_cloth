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
  static const orderStatusTabs = ['Delivered', 'Processing', 'Cancelled'];

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
                  tabs: orderStatusTabs.map((e) {
                    return TabMenuItem(nameTab: e);
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: orderStatusTabs
                      .map(
                        (e) => TabViewItem(
                          status: e,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
