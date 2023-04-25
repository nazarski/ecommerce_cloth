import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';

abstract class ManageShoppingCartRepository {
  Future<void> createUserShoppingCart({
    required int userId,
    required String jwt,
  });

  Future<int> getNumberOfItems({required int userId});

  Future<List<UserCartItemEntity>> getAllCartItems({required int userId});

  Future<int> createCartItem({
    required int systemProductId,
    required String size,
    required int quantity,
  });

  Future<void> bindCartItemIdWithShoppingCart({
    required int cartItemId,
    required int userId,
  });

  Future<void> removeFromCart({required int cartItemId});
}
