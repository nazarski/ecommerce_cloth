import 'package:ecommerce_cloth/core/enums/checkout_status.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:equatable/equatable.dart';

class CheckoutEntity extends Equatable {
  final OrderEntity order;
  final CheckoutStatus status;

  const CheckoutEntity({
    required this.order,
    this.status = CheckoutStatus.initial,
  });

  @override
  List<Object> get props => [
        order,
        status,
      ];
}
