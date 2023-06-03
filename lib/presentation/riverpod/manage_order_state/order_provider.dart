import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = StateNotifierProvider<OrderProvider, OrderEntity>((ref) {
  return OrderProvider();
});

class OrderProvider extends StateNotifier<OrderEntity> {
  OrderProvider() : super(OrderEntity(dateOfSubmission: DateTime.now()));

  void setTotalAmount(int totalAmount) {
    state = state.copyWith(
      totalAmount: totalAmount,
      summary: totalAmount.toDouble(),
    );
  }

  void setPromoCode(PromoCodeEntity? promoCodeEntity) {
    if (promoCodeEntity == null) {
      _deletePromoCode();
    } else {

      final summary =
          ((state.totalAmount * (1 - promoCodeEntity.discount / 100)) +
                  state.deliveryMethod.price)
              .roundToDouble();
      state = state.copyWith(promoCode: promoCodeEntity, summary: summary);
    }
  }

  void setProducts(List<UserCartItemEntity> listOfCartItems) {
    state = state.copyWith(orderedProducts: listOfCartItems);
  }

  void setDeliveryMethod(DeliveryServiceEntity deliveryServiceEntity) {
    final summary = deliveryServiceEntity.price + state.totalAmount.toDouble();
    state = state.copyWith(
      deliveryMethod: deliveryServiceEntity,
      summary: summary,
    );
  }

  void setCard(CardEntity card) {
    state = state.copyWith(payment: card);
  }

  void setAddress(UserAddressEntity addressEntity) {
    state = state.copyWith(shippingAddress: addressEntity);
  }
  void setCartItems(List<UserCartItemEntity> listOfProducts){
    state = state.copyWith(orderedProducts: listOfProducts);
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
