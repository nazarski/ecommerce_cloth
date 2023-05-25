
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:liqpay/liqpay.dart';

abstract class LiqPayRepository {
  Future<LiqPayResponse> liqPayResponse({
    required CardEntity cardModel,
    required double amount,
  });
}
