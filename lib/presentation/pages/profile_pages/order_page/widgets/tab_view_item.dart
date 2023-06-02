import 'dart:developer';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_info_item.dart';

class TabViewItem extends ConsumerWidget {
  const TabViewItem({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfOrders = ref.watch(orderListProvider(status));
    return listOfOrders.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return OrderInfoItem(
              orderEntity: data[index],
              numberOfOrder: data[index].orderId,
              date: '${data[index].dateOfSubmission.day}-${data[index].dateOfSubmission.month}-${data[index].dateOfSubmission.year}',
              trackingNumber: data[index].trackingNumber,
              quantity: data[index].quantity.toString(),
              totalAmount: data[index].totalAmount.toString(),
              status: data[index].status.toString(),
              width: double.infinity,
              height: 200,
            );
          },
        );
      },
      error: (error, stackTrace) {
        log(error.toString());
        log(stackTrace.toString());
        return const Text('An error occurred');
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
