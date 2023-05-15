import 'dart:developer';

import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  static const routeName = 'checkout-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSearchBack(
        title: '',
        search: false,
        elevation: true,
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping address',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 16, left: 24, right: 16, bottom: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Jane Doe',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(onPressed: () {}, child: const Text('Change')),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '3 Newbridge Court Chino Hills, CA 91709, United States',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Shipping address',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Change'),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 64,
              child: Placeholder(),
            ),
            const Spacer(),
            Text(
              'Delivery method',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DeliveryMethodWidget(
                  deliveryServiceEntity: DeliveryServiceEntity(
                      icon: 'assets/icons/dhl.svg',
                      estimated: '2-3 days',
                      id: '1'),
                ),
                DeliveryMethodWidget(
                  deliveryServiceEntity: DeliveryServiceEntity(
                      icon: 'assets/icons/fedex.svg',
                      estimated: '2-3 days',
                      id: '2'),
                ),
                DeliveryMethodWidget(
                  deliveryServiceEntity: DeliveryServiceEntity(
                      icon: 'assets/icons/usps.svg',
                      estimated: '2-3 days',
                      id: '3'),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DeliveryMethodWidget extends ConsumerWidget {
  const DeliveryMethodWidget({Key? key, required this.deliveryServiceEntity})
      : super(key: key);
  final DeliveryServiceEntity deliveryServiceEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderProvider);
    final ifSelected = order.deliveryMethod.id == deliveryServiceEntity.id;
    return GestureDetector(
      onTap: () {
        ref
            .read(orderProvider.notifier)
            .setDeliveryMethod(deliveryServiceEntity);
      },
      child: Container(
        height: 72,
        width: 100,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8),
          border: ifSelected
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  strokeAlign: BorderSide.strokeAlignOutside,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(deliveryServiceEntity.icon),
            SizedBox(
              height: 8,
            ),
            Text(
              deliveryServiceEntity.estimated,
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
      ),
    );
  }
}
