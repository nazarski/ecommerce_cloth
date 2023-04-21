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
    _addProduct(
      favourites: favourites,
      systemProductId: systemProductId,
      size: size,
      userId: userId,
      jwt: jwt,
    );
    return favourites..add(systemProductId);
  }

  Future<void> _addProduct({
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

  // Set<int> removeFromFavourites({
  //   required Set<int> favourites,
  //   required int systemProductId,
  //   required int userId,
  //   required String jwt,
  // }) {
  //   _favouritesRepository.addToFavourites(
  //     jwt: jwt,
  //     userId: userId,
  //     newListOfIds: systemProductId,
  //   );
  //   return favourites..remove(systemProductId);
  // }

  Future<List<String>> getFavouritesTypes({required int userId}) async {
    return await _favouritesRepository.getFavouriteTypes(
      userId: userId,
    );
  }

  Future<List<String>> getAllFavourites({required int userId}) async {
    return await _favouritesRepository.getFavouriteTypes(
      userId: userId,
    );
  }
}
