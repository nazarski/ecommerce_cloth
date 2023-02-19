import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable{
  final int dateOfSubmission;
  final String orderId;
  final DeliveryServiceEntity deliveryMethod;
  final List<UserCartItemEntity> orderedProducts;
  final CardEntity payment;
  final UserAddressEntity shippingAddress;
  final UserInfoEntity user;
  final int totalAmount;

  const OrderEntity({
    required this.dateOfSubmission,
    required this.orderId,
    required this.deliveryMethod,
    required this.orderedProducts,
    required this.payment,
    required this.shippingAddress,
    required this.user,
    required this.totalAmount,
  });

  @override
  List<Object?> get props => [
    dateOfSubmission,
    orderId,
    deliveryMethod,
    orderedProducts,
    payment,
    shippingAddress,
    user,
    totalAmount,
  ];

}