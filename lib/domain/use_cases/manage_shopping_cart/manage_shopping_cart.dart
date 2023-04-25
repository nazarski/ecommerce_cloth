import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_shopping_cart_repository.dart';

class ManageShoppingCart {
  final ManageShoppingCartRepository _cartRepository;

  ManageShoppingCart(this._cartRepository);

  Future<List<UserCartItemEntity>> getAllCartItems(
      {required int userId}) async {
    return await _cartRepository.getAllCartItems(userId: userId);
  }

  Future<void> addToCart({
    required int systemProductId,
    required String size,
    required int quantity,
    required int userId,
  }) async {
    final cartItemId = await _cartRepository.createCartItem(
        systemProductId: systemProductId, size: size, quantity: quantity);
    await _bindItemWithUserCart(cartItemId: cartItemId, userId: userId);
  }

  Future<void> removeFromCart({required int cartItemId}) async {
    await _cartRepository.removeFromCart(cartItemId: cartItemId);
  }

  Future<void> _bindItemWithUserCart({
    required int cartItemId,
    required int userId,
  }) async {
    await _cartRepository.bindCartItemIdWithShoppingCart(
        cartItemId: cartItemId, userId: userId);
  }
}
