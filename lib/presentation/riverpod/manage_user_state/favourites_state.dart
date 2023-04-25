import 'package:ecommerce_cloth/data/repositories/manage_favourites_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_favourites/manage_favourites.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ManageFavourites _favourites =
    ManageFavourites(ManageFavouritesRepositoryImpl());

final favouritesTypesProvider =
    FutureProvider.autoDispose<List<String>>((ref) async {

  final userId = ref.read(userInfoProvider).id;

  return await _favourites.getFavouritesTypes(userId: userId);
});






final favouritesListProvider =
    AutoDisposeFutureProvider<List<UserCartItemEntity>>((ref) async {
  final userId = ref.read(userInfoProvider).id;
  return await _favourites.getAllFavourites(userId: userId);
});
