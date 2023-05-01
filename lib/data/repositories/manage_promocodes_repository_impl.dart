import 'package:ecommerce_cloth/data/data_sources/remote/promocodes_remote_data.dart';
import 'package:ecommerce_cloth/data/models/promocode_model/promo_code_model.dart';
import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/promocodes_repository.dart';

class ManagePromoCodesRepositoryImpl implements PromoCodesRepository {
  @override
  Future<List<PromoCodeEntity>> getPromoCodes() async {
    try {
      final List<PromoCodeModel> models =
          await PromoCodesRemoteData.getPromoCodes();
      return models.map((e) => e.toEntity()).toList();
    } catch (error) {
      throw Future.error(error.toString());
    }
  }
}
