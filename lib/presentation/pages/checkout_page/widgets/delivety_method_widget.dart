import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        padding: const EdgeInsets.only(bottom: 15),
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
            const SizedBox(
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