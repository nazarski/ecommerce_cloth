
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:liqpay/liqpay.dart';

abstract class CheckoutRepository {
  Future<LiqPayResponse> liqPayResponse({
    required CardEntity cardModel,
    required double amount,
  });

  Future<int>postOrder({required OrderEntity order, required int userId});
  Future<void>updatePaymentStatus({required int orderId});
}
