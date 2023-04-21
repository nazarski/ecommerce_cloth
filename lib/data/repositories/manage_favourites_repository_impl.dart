import 'package:ecommerce_cloth/data/data_sources/remote/manage_favourites_data.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_favourites_repository.dart';

class ManageFavouritesRepositoryImpl implements ManageFavouritesRepository {
  @override
  Future<void> addToFavourites({
    required int userId,
    required List<int> newListOfIds,
    required String jwt,
  }) async {
    try {
      await ManageFavouritesData.addToFavourites(
        userId: userId,
        newListOfIds: newListOfIds,
        jwt: jwt,
      );
    } on Exception catch (error) {
      throw Future.error(error);
    }
  }

  @override
  Future<List<UserCartItemEntity>> getFavouriteProducts({
    required int userId,
  }) async {
    // TODO: implement getFavouriteProducts
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromFavourites(
      {required int userId, required int systemProductId}) async {
    // TODO: implement removeFromFavourites
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getFavouriteTypes({
    required int userId,
  }) async {
    // TODO: implement getFavouriteTypes
    throw UnimplementedError();
  }

  @override
  Future<int> createCartItem({
    required int productSystemId,
    required int userId,
    required String size,
  }) async {
    try {
      final cartItemId = await ManageFavouritesData.createCartItem(
          productSystemId: productSystemId, userId: userId, size: size);
      return cartItemId;
    } on Exception catch (error) {
      throw Future.error(error);
    }
  }

  @override
  Future<List<int>> getFavouritesIds({required int userId}) async {
    try {
      return await ManageFavouritesData.getFavouritesIds(userId: userId);
    } on Exception catch (error) {
      throw Future.error(error);
    }
  }
}
