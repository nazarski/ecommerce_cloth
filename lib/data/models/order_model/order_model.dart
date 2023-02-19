import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:ecommerce_cloth/data/models/delivery_service_model/delivery_service_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_address_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_cart_item_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';

class OrderModel {
  final int dateOfSubmission;
  final String orderId;
  final DeliveryServiceModel deliveryMethod;
  final List<UserCartItemModel> orderedProducts;
  final CardModel payment;
  final UserAddressModel shippingAddress;
  final UserInfoModel user;
  final int totalAmount;

  const OrderModel({
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
      user: user.toEntity(),
      totalAmount: totalAmount,
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
      user: UserInfoModel.fromEntity(entity: entity.user),
      totalAmount: entity.totalAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateOfSubmission': dateOfSubmission,
      'orderId': orderId,
      'deliveryMethod': deliveryMethod.toMap(),
      'orderedProducts': orderedProducts.map((e) => e.toMap()),
      'payment': payment.toMap(),
      'shippingAddress': shippingAddress.toMap(),
      'user': user.toMap(),
      'totalAmount': totalAmount,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      dateOfSubmission: map['dateOfSubmission'] as int,
      orderId: map['orderId'] as String,
      deliveryMethod: map['deliveryMethod'].fromMap as DeliveryServiceModel,
      orderedProducts: map['orderedProducts'].map((e) => e.fromMap)
          as List<UserCartItemModel>,
      payment: map['payment'].fromMap as CardModel,
      shippingAddress: map['shippingAddress'].fromMap as UserAddressModel,
      user: map['user'].fromMap as UserInfoModel,
      totalAmount: map['totalAmount'] as int,
    );
  }

//</editor-fold>
}
