import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/liqpay_repository.dart';
import 'package:liqpay/liqpay.dart';

class ManageCheckout {
  final LiqPayRepository _liqPayRepository;

  ManageCheckout(this._liqPayRepository);

  Future<bool> liqPayResponse({
    required CardEntity cardEntity,
    required double amount,
  }) async {
    final LiqPayResponse status = await _liqPayRepository.liqPayResponse(
      cardModel: cardEntity,
      amount: amount,
    );
    if(status.status == "success") {
      return true;
    } else {
      return false;
    }
  }
}
