import 'package:ecommerce_cloth/core/enums/checkout_status.dart';
import 'package:ecommerce_cloth/data/repositories/checkout_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_checkout/manage_checkout.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ManageCheckout _checkout = ManageCheckout(CheckoutRepositoryImpl());

final checkoutProvider =
    StateNotifierProvider.autoDispose<CheckoutProvider, CheckoutStatus>((ref) {
  final userId = ref.read(userInfoProvider).id;
  return CheckoutProvider(userId);
});

class CheckoutProvider extends StateNotifier<CheckoutStatus> {
  CheckoutProvider(this.userId) : super(CheckoutStatus.initial);
  final int userId;

  Future<void> placeOrder({required OrderEntity order}) async {
    state = CheckoutStatus.loading;
    final CheckoutStatus status = await _checkout.placeOrder(
      order: order,
      userId: userId,
    );
    state = status;
  }
}
