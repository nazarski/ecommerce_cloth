import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_shopping_cart_repository.dart';

class ManageShoppingCartRepositoryImpl implements ManageShoppingCartRepository {
  @override
  Future<void> addToCart({required int cartItemId}) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<int> createCartItem({required int systemProductId, required String size, required int quantity}) {
    // TODO: implement createCartItem
    throw UnimplementedError();
  }

  @override
  Future<void> createUserShoppingCart({required int userId}) {
    // TODO: implement createUserShoppingCart
    throw UnimplementedError();
  }

  @override
  Future<List<UserCartItemEntity>> getAllCartItems({required int userId}) {
    // TODO: implement getAllCartItems
    throw UnimplementedError();
  }

  @override
  Future<int> getNumberOfItems({required int userId}) {
    // TODO: implement getNumberOfItems
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart({required int cartItemId}) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
  
}