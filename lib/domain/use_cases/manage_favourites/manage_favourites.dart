import 'dart:developer';

import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_favourites_repository.dart';

class ManageFavourites {
  const ManageFavourites(this._favouritesRepository);

  final ManageFavouritesRepository _favouritesRepository;

  Set<int> addToFavourites({
    required Set<int> favourites,
    required int systemProductId,
    required String size,
    required int userId,
    required String jwt,
  }) {
    _createItemAndAddToFavourites(
      favourites: favourites,
      systemProductId: systemProductId,
      size: size,
      userId: userId,
      jwt: jwt,
    );
    return favourites..add(systemProductId);
  }

  Future<void> _createItemAndAddToFavourites({
    required Set<int> favourites,
    required int systemProductId,
    required String size,
    required int userId,
    required String jwt,
  }) async {
    final cartId = await _favouritesRepository.createCartItem(
      userId: userId,
      productSystemId: systemProductId,
      size: size,
    );
    final listOfIds =
        await _favouritesRepository.getFavouritesIds(userId: userId);
    await _favouritesRepository.addToFavourites(
      userId: userId,
      newListOfIds: listOfIds..add(cartId),
      jwt: jwt,
    );
  }

  Set<int> removeFromFavourites({
    required Set<int> favourites,
    required int systemProductId,
    required int userId,
    required String jwt,
  }) {
    _getIdAndRemove(userId: userId, systemProductId: systemProductId);
    return favourites..remove(systemProductId);
  }

  Future<void> _getIdAndRemove({
    required int userId,
    required int systemProductId,
  }) async {
    final cartItemId = await _favouritesRepository.getCartItemIdFromProductId(
      userId: userId,
      systemProductId: systemProductId,
    );
    log(cartItemId.toString());
    await _favouritesRepository.removeCartItem(
      cartItemId: cartItemId,
    );
  }

  Future<List<String>> getFavouritesTypes({required int userId}) async {
    return await _favouritesRepository.getFavouriteTypes(
      userId: userId,
    );
  }

  Future<List<UserCartItemEntity>> getAllFavourites({required int userId}) async {
    try {
      return await _favouritesRepository.getFavouriteProducts(userId: userId);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
