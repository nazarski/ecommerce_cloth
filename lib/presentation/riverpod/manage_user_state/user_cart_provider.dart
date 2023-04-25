import 'package:ecommerce_cloth/data/repositories/manage_shopping_cart_repository_impl.dart';
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

  Future<void> addCartItem(
      {required int systemProductId, required String size}) async {
    await _userCart.addToCart(
      systemProductId: systemProductId,
      size: size,
      quantity: 1,
      userId: userId,
    );
    await _getAllCartItems(userId: userId);
  }
}
