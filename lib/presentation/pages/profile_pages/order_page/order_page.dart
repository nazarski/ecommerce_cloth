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

class _OrderPageState extends ConsumerState<OrderPage> with SingleTickerProviderStateMixin {
  final List<OrderEntity> fakeListDelivered = [
    OrderEntity(
      quantity: 2,
      trackingNumber: 'gomunkul3232323',
      dateOfSubmission: DateTime.now(),
      orderId: '121212',
      deliveryMethod: const DeliveryServiceEntity(id: '', estimated: '', icon: '', price: 2, service: ''),
      orderedProducts: [],
      payment: const CardEntity(cardNumber: 1, cardDate: 1, cvvCode: 1, cardType: '', cardIcon: ''),
      shippingAddress: const UserAddressEntity(
          addressId: '', address: '', city: '', country: '', fullName: '', primary: true, region: '', zipCode: ''),
      user: UserInfoEntity(
          jwt: '', id: 1, createdAt: DateTime.now(), displayName: '', email: '', favorites: [], photoUrl: '', fullName: '', dateOfBirth: ''),
      totalAmount: 140,
      status: 'Delivered',
    ),
    OrderEntity(
      quantity: 2,
      trackingNumber: 'cobra22323',
      dateOfSubmission: DateTime.now(),
      orderId: '4333434',
      deliveryMethod: const DeliveryServiceEntity(id: '', estimated: '', icon: '', price: 2, service: ''),
      orderedProducts: [],
      payment: const CardEntity(cardNumber: 1, cardDate: 1, cvvCode: 1, cardType: '', cardIcon: ''),
      shippingAddress: const UserAddressEntity(
          addressId: '', address: '', city: '', country: '', fullName: '', primary: true, region: '', zipCode: ''),
      user: UserInfoEntity(
          jwt: '', id: 1, createdAt: DateTime.now(), displayName: '', email: '', favorites: [], photoUrl: '', fullName: '', dateOfBirth: ''),
      totalAmount: 140,
      status: 'Delivered',
    ),
  ];
  final List<OrderEntity> fakeListProcessing = [
    OrderEntity(
      quantity: 2,
      trackingNumber: 'gomunkul3232323',
      dateOfSubmission: DateTime.now(),
      orderId: '121212',
      deliveryMethod: const DeliveryServiceEntity(id: '', estimated: '', icon: '', price: 2, service: ''),
      orderedProducts: [],
      payment: const CardEntity(cardNumber: 1, cardDate: 1, cvvCode: 1, cardType: '', cardIcon: ''),
      shippingAddress: const UserAddressEntity(
          addressId: '', address: '', city: '', country: '', fullName: '', primary: true, region: '', zipCode: ''),
      user: UserInfoEntity(
          jwt: '', id: 1, createdAt: DateTime.now(), displayName: '', email: '', favorites: [], photoUrl: '', fullName: '', dateOfBirth: ''),
      totalAmount: 140,
      status: 'Processed',
    ),
    OrderEntity(
      quantity: 2,
      trackingNumber: 'cobra22323',
      dateOfSubmission: DateTime.now(),
      orderId: '4333434',
      deliveryMethod: const DeliveryServiceEntity(id: '', estimated: '', icon: '', price: 2, service: ''),
      orderedProducts: [],
      payment: const CardEntity(cardNumber: 1, cardDate: 1, cvvCode: 1, cardType: '', cardIcon: ''),
      shippingAddress: const UserAddressEntity(
          addressId: '', address: '', city: '', country: '', fullName: '', primary: true, region: '', zipCode: ''),
      user: UserInfoEntity(
          jwt: '', id: 1, createdAt: DateTime.now(), displayName: '', email: '', favorites: [], photoUrl: '', fullName: '', dateOfBirth: ''),
      totalAmount: 140,
      status: 'Processed',
    ),
  ];
  final List<OrderEntity> fakeListCanceled = [
    OrderEntity(
      quantity: 2,
      trackingNumber: 'gomunkul3232323',
      dateOfSubmission: DateTime.now(),
      orderId: '121212',
      deliveryMethod: const DeliveryServiceEntity(id: '', estimated: '', icon: '', price: 2, service: ''),
      orderedProducts: [],
      payment: const CardEntity(cardNumber: 1, cardDate: 1, cvvCode: 1, cardType: '', cardIcon: ''),
      shippingAddress: const UserAddressEntity(
          addressId: '', address: '', city: '', country: '', fullName: '', primary: true, region: '', zipCode: ''),
      user: UserInfoEntity(
          jwt: '', id: 1, createdAt: DateTime.now(), displayName: '', email: '', favorites: [], photoUrl: '', fullName: '', dateOfBirth: ''),
      totalAmount: 140,
      status: 'Canceled',
    ),
    OrderEntity(
      quantity: 2,
      trackingNumber: 'cobra22323',
      dateOfSubmission: DateTime.now(),
      orderId: '4333434',
      deliveryMethod: const DeliveryServiceEntity(id: '', estimated: '', icon: '', price: 2, service: ''),
      orderedProducts: [],
      payment: const CardEntity(cardNumber: 1, cardDate: 1, cvvCode: 1, cardType: '', cardIcon: ''),
      shippingAddress: const UserAddressEntity(
          addressId: '', address: '', city: '', country: '', fullName: '', primary: true, region: '', zipCode: ''),
      user: UserInfoEntity(
          jwt: '', id: 1, createdAt: DateTime.now(), displayName: '', email: '', favorites: [], photoUrl: '', fullName: '', dateOfBirth: ''),
      totalAmount: 140,
      status: 'Canceled',
    ),
  ];

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
              Text('My Orders', style: Theme.of(context).textTheme.displayLarge),
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
