
import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:liqpay/liqpay.dart';

class ManageCheckoutData {
  ManageCheckoutData._();

  static final _dio = Dio();
  static const _endPoint = StrapiInitialize.apiEndpoint;

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

  static Future<int> placeOrder({required Map<String, dynamic> order}) async {
    final response = await _dio.post('$_endPoint/orders', data: {'data' : order});
    return response.data['data']['id'];
  }

  static Future<void> updatePaymentStatus({required orderId}) async {
    await _dio.put('$_endPoint/orders/$orderId', data: {
      'data': {'status': 'Payment received'}
    });

  }
}