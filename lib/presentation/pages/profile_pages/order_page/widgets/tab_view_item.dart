import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:flutter/material.dart';

import 'order_info_item.dart';

class TabViewItem extends StatelessWidget {
  const TabViewItem({
    super.key,
    required this.listOfOrders,
  });

  final List<OrderEntity> listOfOrders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfOrders.length,
      itemBuilder: (context, index) {
        return OrderInfoItem(
            numberOfOrder: listOfOrders[index].orderId,
            date: listOfOrders[index].dateOfSubmission.toString(),
            trackingNumber: listOfOrders[index].trackingNumber,
            quantity: listOfOrders[index].quantity.toString(),
            totalAmount: listOfOrders[index].totalAmount.toString(),
            status: listOfOrders[index].status.toString());
      },
    );
  }
}