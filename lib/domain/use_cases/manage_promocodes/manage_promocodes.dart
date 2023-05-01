import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/promocodes_repository.dart';

class ManagePromoCodes {
  final PromoCodesRepository _promoCodesRepository;
  const ManagePromoCodes(this._promoCodesRepository);

  Future<List<PromoCodeEntity>> getPromocodes() async {
    return await _promoCodesRepository.getPromoCodes();
  }
}
