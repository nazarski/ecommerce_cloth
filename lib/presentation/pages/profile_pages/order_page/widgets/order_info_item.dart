import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
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
    required this.width,
    required this.height,
    required this.orderEntity,
  });

  final double width;
  final OrderEntity orderEntity;
  final double height;
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
      width: width,
      height: height,
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
                    onPressed: () {
                      buildShowModalBottomSheet(
                          context: context,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Order Date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Text(
                                          date,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ],
                                    ),
                                    ...List.generate(
                                        orderEntity.orderedProducts.length,
                                        (index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: GestureDetector(
                                          onTap: (){
                                            // Navigator.of(context, rootNavigator: true)
                                            //     .pushNamed(ProductPage.routeName, arguments:  orderEntity.orderedProducts[index].product);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    spreadRadius: 5,
                                                    blurRadius: 8,
                                                    offset: const Offset(0, 0.75),
                                                  )
                                                ]),
                                            child: ListTile(
                                              leading: Image.network(
                                                orderEntity.orderedProducts[index]
                                                    .product.images.first,
                                                alignment: Alignment.topCenter,
                                                width: 64,
                                                height: 64,
                                                fit: BoxFit.cover,
                                              ),
                                              title: Row(
                                                children: [
                                                  Text('Type: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium),
                                                  Text(
                                                      orderEntity
                                                          .orderedProducts[index]
                                                          .product
                                                          .productType,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium),
                                                ],
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text('Brand: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium),
                                                  Text(
                                                      orderEntity
                                                          .orderedProducts[index]
                                                          .product
                                                          .brand,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium),
                                                ],
                                              ),
                                              trailing: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('Size: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium),
                                                  Text(orderEntity
                                                      .orderedProducts[index].size),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                    Row(
                                      children: [
                                        Text('Total Amount: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                        Text('$totalAmount\$', style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text('Quantity: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                        Text(quantity, style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text('Delivery status: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                        Text(status, style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          header: 'Order Details');
                    },
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

Color getStatusColor(String status, BuildContext context) {
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
}