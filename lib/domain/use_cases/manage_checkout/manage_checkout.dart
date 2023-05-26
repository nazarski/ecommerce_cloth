import 'dart:developer';

import 'package:ecommerce_cloth/core/enums/checkout_status.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/liqpay_repository.dart';
import 'package:flutter/material.dart';
import 'package:liqpay/liqpay.dart';

class ManageCheckout {
  final CheckoutRepository _checkoutRepository;

  ManageCheckout(this._checkoutRepository);

  Future<bool> liqPayResponse({
    required CardEntity cardEntity,
    required double amount,
  }) async {
    final LiqPayResponse status = await _checkoutRepository.liqPayResponse(
      cardModel: cardEntity,
      amount: amount,
    );
    if (status.status == "success") {
      return true;
    } else {
      return false;
    }
  }

  Future<CheckoutStatus> placeOrder(
      {required OrderEntity order, required int userId}) async {
    final newOrder = order.copyWith(
      status: 'Payment not received',
      orderId: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    try {
      final newOrderId = await _checkoutRepository.postOrder(
        order: newOrder,
        userId: userId,
      );
      return await _payAndUpdate(
        newOrderId: newOrderId,
        card: order.payment,
        amount: order.summary,
      );
    } on Exception catch (error) {
      log(error.toString());
      return CheckoutStatus.errorPlace;
    }
  }

  Future<CheckoutStatus> _payAndUpdate({
    required int newOrderId,
    required CardEntity card,
    required double amount,
  }) async {
    final paymentSuccess = await liqPayResponse(
      cardEntity: card,
      amount: amount,
    );
    if (!paymentSuccess) {
      return CheckoutStatus.errorPay;
    }
    log('payed, updating order');
    await _checkoutRepository.updatePaymentStatus(orderId: newOrderId);
    return CheckoutStatus.success;
  }
}
