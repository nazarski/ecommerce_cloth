import 'package:ecommerce_cloth/data/data_sources/remote/liqpay_checkout_data.dart';
import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/liqpay_repository.dart';
import 'package:liqpay/src/models/network/liqpay_response.dart';

class LiqPayRepositoryImpl extends LiqPayRepository {
  @override
  Future<LiqPayResponse> liqPayResponse({
    required CardEntity cardModel,
    required double amount,
  }) async {
    final CardModel toCardModel = CardModel.fromEntity(entity: cardModel);
    return await LiqPayCheckout.liqPayResponse(
      cardModel: toCardModel,
      amount: amount,
    );
  }
}
