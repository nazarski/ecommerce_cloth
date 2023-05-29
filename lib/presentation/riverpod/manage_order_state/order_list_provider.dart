import 'package:ecommerce_cloth/data/repositories/manage_orders_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_orders/manage_orders.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _manageOrders = ManageOrders(ManageOrdersRepositoryImpl());
final orderListProvider = FutureProvider.autoDispose
    .family<List<OrderEntity>, String>((ref, category) async {
  final userId = ref.read(userInfoProvider).id;
  return await _manageOrders.getOrderByStatus(
    status: category,
    userId: userId,
  );
});
