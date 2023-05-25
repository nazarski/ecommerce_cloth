import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:liqpay/liqpay.dart';

class LiqPayCheckout {
  LiqPayCheckout._();

  static final LiqPay _liqPay = LiqPay("sandbox_i22302684763",
      "sandbox_fXM651nMefvszsRQioClieIqGssbfFskzsVhPvns");

  static Future<LiqPayResponse> liqPayResponse({
    required CardModel cardModel,
    required double amount,
  }) async {
    final List<String> cardDate = cardModel.cardDate.split('/');
    final LiqPayCard card = LiqPayCard(
      cardModel.cardNumber.toString(),
      cardDate.first,
      cardDate.last,
      '123',
    );
    final LiqPayOrder order = LiqPayOrder(
      DateTime.now().millisecondsSinceEpoch.toString(),
      amount,
      'LambDa',
      card: card,
      action: LiqPayAction.auth,
      currency: LiqPayCurrency.usd,
    );
    return await _liqPay.purchase(order);
  }
}

