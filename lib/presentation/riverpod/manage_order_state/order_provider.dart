
import 'package:ecommerce_cloth/data/repositories/liqpay_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_checkout/manage_checkout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ManageCheckout _checkout = ManageCheckout(LiqPayRepositoryImpl());

final orderProvider = StateNotifierProvider<OrderProvider, OrderEntity>((ref) {
  return OrderProvider();
});

class OrderProvider extends StateNotifier<OrderEntity> {
  OrderProvider() : super(OrderEntity(dateOfSubmission: DateTime.now()));

  void setTotalAmount(int totalAmount) {
    state = state.copyWith(totalAmount: totalAmount);
  }

  void setPromoCode(PromoCodeEntity? promoCodeEntity) {
    if (promoCodeEntity == null) {
      _deletePromoCode();
    } else {
      state = state.copyWith(promoCode: promoCodeEntity);
    }
  }

  void setProducts(List<UserCartItemEntity> listOfCartItems) {
    state = state.copyWith(orderedProducts: listOfCartItems);
  }

  void setDeliveryMethod(DeliveryServiceEntity deliveryServiceEntity) {
    state = state.copyWith(
      deliveryMethod: deliveryServiceEntity,
    );
  }

  Future<bool> liqPayPay({
    required CardEntity cardEntity,
    required double amount,
  }) async {
    return await _checkout.liqPayResponse(
        cardEntity: cardEntity, amount: amount);
  }

  void _deletePromoCode() {
    state = OrderEntity(
      dateOfSubmission: DateTime.now(),
      orderId: state.orderId,
      deliveryMethod: state.deliveryMethod,
      orderedProducts: state.orderedProducts,
      payment: state.payment,
      shippingAddress: state.shippingAddress,
      user: state.user,
      totalAmount: state.totalAmount,
      trackingNumber: state.trackingNumber,
      quantity: state.quantity,
      status: state.status,
    );
  }
}
