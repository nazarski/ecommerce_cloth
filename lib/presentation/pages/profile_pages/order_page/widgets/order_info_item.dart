import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.numberOfOrder,
    required this.date,
    required this.trackingNumber,
    required this.quantity,
    required this.totalAmount,
    required this.status,
  });

  final String numberOfOrder;
  final String date;
  final String trackingNumber;
  final String quantity;
  final String totalAmount;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: 380,
      height: 180,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 0.75),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order №$numberOfOrder',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  date,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Tracking number:',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 5),
                Text(
                  trackingNumber,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    Text(
                      'Quantity:',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      quantity,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'Total Amount:',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$totalAmount\$',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Details'),
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    color: (() {
                      switch (status) {
                        case 'Delivered':
                          return Theme.of(context).colorScheme.onError;
                        case 'Processed':
                          return Colors.orange;
                        case 'Canceled':
                          return Theme.of(context).colorScheme.primary;
                        default:
                          return Theme.of(context).colorScheme.onError;
                      }
                    }()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
