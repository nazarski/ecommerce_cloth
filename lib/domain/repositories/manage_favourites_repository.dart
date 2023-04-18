import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';

abstract class ManageFavouritesRepository {
  Future<void> addToFavourites({
    required int userId,
    required int systemProductId,
  });

  Future<void> removeFromFavourites({
    required int userId,
    required int systemProductId,
  });

  Future<List<UserCartItemEntity>> getFavouriteProducts({
    required int userId,
  });
  Future<List<String>> getFavouriteTypes({
    required int userId,
  });
}
