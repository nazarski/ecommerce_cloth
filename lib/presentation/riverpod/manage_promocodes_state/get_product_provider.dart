
import 'package:ecommerce_cloth/data/repositories/manage_promocodes_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_promocodes/manage_promocodes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPromocodes = ManagePromoCodes(ManagePromoCodesRepositoryImpl());

final promoCodesProvider = FutureProvider<List<PromoCodeEntity>>((ref) async {
  final result = await getPromocodes.getPromocodes();
  return result;
});
