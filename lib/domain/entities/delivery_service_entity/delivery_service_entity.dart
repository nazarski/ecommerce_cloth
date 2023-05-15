import 'package:equatable/equatable.dart';

class DeliveryServiceEntity extends Equatable {
  final String id;
  final String estimated;
  final String icon;
  final int price;
  final String service;

  const DeliveryServiceEntity({
    this.id = '',
    this.estimated = '',
    this.icon = '',
    this.price = 0,
    this.service = '',
  });

  @override
  List<Object?> get props => [
        id,
        estimated,
        icon,
        price,
        service,
      ];
}
