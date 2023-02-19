import 'package:equatable/equatable.dart';

class DeliveryServiceEntity extends Equatable {
  final String id;
  final String estimated;
  final String icon;
  final int price;
  final String service;

  const DeliveryServiceEntity({
    required this.id,
    required this.estimated,
    required this.icon,
    required this.price,
    required this.service,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        estimated,
        icon,
        price,
        service,
      ];
}
