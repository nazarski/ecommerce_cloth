import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';

abstract class PromoCodesRepository {
  Future<List<PromoCodeEntity>> getPromoCodes();
}
