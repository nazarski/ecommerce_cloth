import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:ecommerce_cloth/data/models/delivery_service_model/delivery_service_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_address_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_cart_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';

class OrderModel {
  final int dateOfSubmission;
  final String orderId;
  final DeliveryServiceModel deliveryMethod;
  final List<UserCartModel> orderedProducts;
  final CardModel payment;
  final UserAddressModel shippingAddress;
  final UserInfoModel user;
  final int totalAmount;

//<editor-fold desc="Data Methods">
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderModel &&
          runtimeType == other.runtimeType &&
          dateOfSubmission == other.dateOfSubmission &&
          orderId == other.orderId &&
          deliveryMethod == other.deliveryMethod &&
          orderedProducts == other.orderedProducts &&
          payment == other.payment &&
          shippingAddress == other.shippingAddress &&
          user == other.user &&
          totalAmount == other.totalAmount);

  @override
  int get hashCode =>
      dateOfSubmission.hashCode ^
      orderId.hashCode ^
      deliveryMethod.hashCode ^
      orderedProducts.hashCode ^
      payment.hashCode ^
      shippingAddress.hashCode ^
      user.hashCode ^
      totalAmount.hashCode;

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
        'totalAmount: $totalAmount,}';
  }

  OrderModel copyWith({
    int? dateOfSubmission,
    String? orderId,
    DeliveryServiceModel? deliveryMethod,
    List<UserCartModel>? orderedProducts,
    CardModel? payment,
    UserAddressModel? shippingAddress,
    UserInfoModel? user,
    int? totalAmount,
  }) {
    return OrderModel(
      dateOfSubmission: dateOfSubmission ?? this.dateOfSubmission,
      orderId: orderId ?? this.orderId,
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      orderedProducts: orderedProducts ?? this.orderedProducts,
      payment: payment ?? this.payment,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      user: user ?? this.user,
      totalAmount: totalAmount ?? this.totalAmount,
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
      orderedProducts:
          map['orderedProducts'].map((e) => e.fromMap) as List<UserCartModel>,
      payment: map['payment'].fromMap as CardModel,
      shippingAddress: map['shippingAddress'].fromMap as UserAddressModel,
      user: map['user'].fromMap as UserInfoModel,
      totalAmount: map['totalAmount'] as int,
    );
  }

//</editor-fold>
}
