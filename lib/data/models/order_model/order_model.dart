import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:ecommerce_cloth/data/models/delivery_service_model/delivery_service_model.dart';
import 'package:ecommerce_cloth/data/models/promocode_model/promo_code_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_address_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_cart_item_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';

class OrderModel {
  final DateTime dateOfSubmission;
  final String orderId;
  final DeliveryServiceModel deliveryMethod;
  final Iterable<UserCartItemModel> orderedProducts;
  final CardModel payment;
  final UserAddressModel shippingAddress;
  final UserInfoModel? user;
  final int totalAmount;
  final String trackingNumber;
  final int quantity;
  final String status;
  final PromoCodeModel? promoCode;

  const OrderModel({
    required this.dateOfSubmission,
    required this.trackingNumber,
    required this.quantity,
    required this.status,
    required this.promoCode,
    required this.orderId,
    required this.deliveryMethod,
    required this.orderedProducts,
    required this.payment,
    required this.shippingAddress,
    required this.user,
    required this.totalAmount,
  });

  @override
  String toString() {
    return 'OrderModel{ '
        'dateOfSubmission: $dateOfSubmission, '
        'orderId: $orderId, '
        'deliveryMethod: $deliveryMethod, '
        'orderedProducts: $orderedProducts, '
        'payment: $payment, '
        'shippingAddress: $shippingAddress, '
        'user: $user, '
        'totalAmount: $totalAmount,'
        '}';
  }

  OrderEntity toEntity() {
    return OrderEntity(
      dateOfSubmission: dateOfSubmission,
      orderId: orderId,
      deliveryMethod: deliveryMethod.toEntity(),
      orderedProducts: orderedProducts.map((e) => e.toEntity()).toList(),
      payment: payment.toEntity(),
      shippingAddress: shippingAddress.toEntity(),
      user: user?.toEntity(),
      totalAmount: totalAmount,
      quantity: quantity,
      trackingNumber: trackingNumber,
      status: status,
      promoCode: promoCode?.toEntity(),
    );
  }

  factory OrderModel.fromEntity({required OrderEntity entity}) {
    return OrderModel(
      dateOfSubmission: entity.dateOfSubmission,
      orderId: entity.orderId,
      deliveryMethod:
          DeliveryServiceModel.fromEntity(entity: entity.deliveryMethod),
      orderedProducts: entity.orderedProducts
          .map((e) => UserCartItemModel.fromEntity(entity: e))
          .toList(),
      payment: CardModel.fromEntity(entity: entity.payment),
      shippingAddress:
          UserAddressModel.fromEntity(entity: entity.shippingAddress),
      user: entity.user != null
          ? UserInfoModel.fromEntity(entity: entity.user!)
          : null,
      totalAmount: entity.totalAmount,
      trackingNumber: entity.trackingNumber,
      quantity: entity.quantity,
      status: entity.status,
      promoCode: entity.promoCode != null
          ? PromoCodeModel.fromEntity(entity: entity.promoCode!)
          : null,
    );
  }

  Map<String, dynamic> toMap(int userId) {
    return {
      'dateOfSubmission': dateOfSubmission.toIso8601String(),
      'orderId': orderId,
      'deliveryMethod': deliveryMethod.toMap(),
      'orderedProducts':
          orderedProducts.map((cartItem) => cartItem.toMap()).toList(),
      'payment': payment.toMap(),
      'shippingAddress': shippingAddress.toMap(),
      'user': userId,
      'totalAmount': totalAmount,
      'quantity': quantity,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      dateOfSubmission: DateTime.parse(map['dateOfSubmission']),
      orderId: map['orderId'] as String,
      deliveryMethod: DeliveryServiceModel.fromMap(map['deliveryMethod']),
      orderedProducts:
          List<Map<String, dynamic>>.from(map['orderedProducts']).map((e) {
        return UserCartItemModel.fromOrderMap(e);
      }),
      payment: CardModel.fromMap(map['payment']),
      shippingAddress: UserAddressModel.fromMap(map['shippingAddress']),
      totalAmount: map['totalAmount'] as int,
      trackingNumber: map['trackingNumber'] ?? '',
      quantity: map['quantity'] ,
      status: map['status'],
      promoCode: map['promoCode'],
      user: null,
    );
  }
}
