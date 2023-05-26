import 'dart:developer';

import 'package:ecommerce_cloth/data/data_sources/remote/liqpay_checkout_data.dart';
import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:ecommerce_cloth/data/models/order_model/order_model.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/liqpay_repository.dart';
import 'package:liqpay/liqpay.dart';

class CheckoutRepositoryImpl extends CheckoutRepository {
  @override
  Future<LiqPayResponse> liqPayResponse({
    required CardEntity cardModel,
    required double amount,
  }) async {
    final CardModel toCardModel = CardModel.fromEntity(entity: cardModel);
    return await ManageCheckoutData.liqPayResponse(
      cardModel: toCardModel,
      amount: amount,
    );
  }

  @override
  Future<int> postOrder({required OrderEntity order, required int userId}) async{
    final orderMap = OrderModel.fromEntity(entity: order).toMap(userId);
    final int orderId = await ManageCheckoutData.placeOrder(order: orderMap);
    return orderId;
  }

  @override
  Future<void> updatePaymentStatus({required int orderId})async {
    await ManageCheckoutData.updatePaymentStatus(orderId: orderId);
  }


}
