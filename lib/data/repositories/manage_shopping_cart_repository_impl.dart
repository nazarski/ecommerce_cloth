import 'dart:ui';

import 'package:ecommerce_cloth/data/data_sources/remote/manage_shopping_cart_data.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_shopping_cart_repository.dart';

class ManageShoppingCartRepositoryImpl implements ManageShoppingCartRepository {
  @override
  Future<void> bindCartItemIdWithShoppingCart(
      {required int cartItemId, required int userId}) async {
    try {
      await ManageShoppingCartData.bindIdWithShoppingCart(
        cartItemId: cartItemId,
        userId: userId,
      );
    } on Exception catch (error) {
      throw Future.error(error);
    }
  }

  @override
  Future<int> createCartItem(
      {required int systemProductId,
      required String size,
      required int quantity}) async {
    try {
      final cartItemId = await ManageShoppingCartData.createCartItem(
        productSystemId: systemProductId,
        quantity: quantity,
        size: size,
      );
      return cartItemId;
    } on Exception catch (error) {
      throw Future.error(error);
    }
  }

  @override
  Future<void> createUserShoppingCart({
    required int userId,
    required String jwt,
  }) async {
    try {
      await ManageShoppingCartData.createUserCart(userId: userId, jwt: jwt);
    } on Exception catch (error) {
      throw Future.error(error);
    }
  }

  @override
  Future<List<UserCartItemEntity>> getAllCartItems(
      {required int userId}) async {
    final data = await ManageShoppingCartData.getAllCartItems(userId: userId);
    return data.map((e) => e.toEntity()).toList();
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
