import 'package:ecommerce_cloth/data/repositories/manage_shopping_cart_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_shopping_cart/manage_shopping_cart.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _userCart = ManageShoppingCart(ManageShoppingCartRepositoryImpl());

final userCartProvider = StateNotifierProvider<UserCartProvider,
    AsyncValue<List<UserCartItemEntity>>>((ref) {
  final userId = ref.read(userInfoProvider).id;
  return UserCartProvider(userId);
});

class UserCartProvider
    extends StateNotifier<AsyncValue<List<UserCartItemEntity>>> {
  UserCartProvider(this.userId) : super(const AsyncLoading()) {
    _getAllCartItems(userId: userId);
  }

  final int userId;

  Future<void> _getAllCartItems({required int userId}) async {
    try {
      final listOfItems = await _userCart.getAllCartItems(userId: userId);
      state = AsyncData(listOfItems);
    } on Exception catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> emptyCart() async {
    try {
     await _userCart.removeItemsFromCart(listOfItems: state.value!);
      state = const AsyncData([]);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> addCartItem(
      {required ProductEntity product, required String size}) async {
    final indexIfPresent = state.value!.indexWhere(
      (element) =>
          element.product.colors.first == product.colors.first &&
          element.size == size &&
          element.product.systemId == product.systemId,
    );
    if (indexIfPresent >= 0) {
      changeQuantity(1, state.value![indexIfPresent]);
    } else {
      await _userCart.addToCart(
        systemProductId: product.systemId,
        size: size,
        quantity: 1,
        userId: userId,
      );
      await _getAllCartItems(userId: userId);
    }
  }

  void changeQuantity(int value, UserCartItemEntity cartItem) {
    final newListOfItems = _userCart.changeItemQuantity(
        items: state.value!, value: value, itemToUpdate: cartItem);
    if (newListOfItems.length < state.value!.length) {
      _getAllCartItems(userId: userId);
    }
    state = AsyncData(newListOfItems);
  }

  Future<void> removeCartItem({required UserCartItemEntity cartItem}) async {
    state = AsyncData(state.value!..remove(cartItem));
    _userCart.removeFromCart(cartItemId: cartItem.id);
  }
}
