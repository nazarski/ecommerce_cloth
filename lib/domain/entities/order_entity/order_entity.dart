import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final DateTime dateOfSubmission;
  final String orderId;
  final DeliveryServiceEntity deliveryMethod;
  final List<UserCartItemEntity> orderedProducts;
  final CardEntity payment;
  final UserAddressEntity shippingAddress;
  final UserInfoEntity user;
  final int totalAmount;
  final String trackingNumber;
  final int quantity;
  final String status;
  final PromoCodeEntity? promoCode;

  const OrderEntity({
    this.promoCode,
    this.status = 'none',
    this.quantity = 0,
    this.trackingNumber = 'none',
    required this.dateOfSubmission,
     this.orderId = 'none',
     this.deliveryMethod = const DeliveryServiceEntity(),
     this.orderedProducts = const [],
     this.payment = const CardEntity(),
     this.shippingAddress = const UserAddressEntity(),
     this.user = const UserInfoEntity(),
     this.totalAmount = 0,
  });

  @override
  List<Object?> get props => [
        promoCode,
        status,
        quantity,
        trackingNumber,
        dateOfSubmission,
        orderId,
        deliveryMethod,
        orderedProducts,
        payment,
        shippingAddress,
        user,
        totalAmount,
      ];

  OrderEntity copyWith({
    DateTime? dateOfSubmission,
    String? orderId,
    DeliveryServiceEntity? deliveryMethod,
    List<UserCartItemEntity>? orderedProducts,
    CardEntity? payment,
    UserAddressEntity? shippingAddress,
    UserInfoEntity? user,
    int? totalAmount,
    String? trackingNumber,
    int? quantity,
    String? status,
    PromoCodeEntity? promoCode,
  }) {
    return OrderEntity(
      dateOfSubmission: dateOfSubmission ?? this.dateOfSubmission,
      orderId: orderId ?? this.orderId,
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      orderedProducts: orderedProducts ?? this.orderedProducts,
      payment: payment ?? this.payment,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      user: user ?? this.user,
      totalAmount: totalAmount ?? this.totalAmount,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      promoCode: promoCode ?? this.promoCode,
    );
  }
}
