import 'package:ecommerce_cloth/domain/repositories/manage_favourites_repository.dart';

class ManageFavourites {
  const ManageFavourites(this._favouritesRepository);

  final ManageFavouritesRepository _favouritesRepository;

  Set<int> toggleFavourites({
    required Set<int> favourites,
    required int systemProductId,
    required String size,
    required int userId,
    required String jwt,
  }) {
    if (!favourites.contains(systemProductId)) {
      _addToFavourites(
        systemProductId: systemProductId,
        size: size,
        userId: userId,
        jwt: jwt,
      );
      return favourites..add(systemProductId);
    }
    _deleteFromFavourites(
      systemProductId: systemProductId,
      size: size,
      userId: userId,
      jwt: jwt,
    );
    return favourites..remove(systemProductId);
  }

  Future<void> _addToFavourites({
    required int systemProductId,
    required String size,
    required int userId,
    required String jwt,
  }) async {
    _favouritesRepository.addToFavourites(
      userId: userId,
      systemProductId: systemProductId,
    );
  }

  Future<void> _deleteFromFavourites({
    required int systemProductId,
    required String size,
    required int userId,
    required String jwt,
  }) async {
    _favouritesRepository.addToFavourites(
      userId: userId,
      systemProductId: systemProductId,
    );
  }

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
