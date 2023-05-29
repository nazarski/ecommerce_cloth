import 'package:ecommerce_cloth/data/data_sources/remote/manage_orders_data.dart';
import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_orders_repository.dart';

class ManageOrdersRepositoryImpl extends ManageOrdersRepository {
  @override
  Future<List<OrderEntity>> getOrdersByStatus({
    required String status,
    required int userId,
  }) async {
    final orders = await ManageOrdersData.getOrdersFromStatus(
      status: status,
      userId: userId,
    );
    return orders.map((e) => e.toEntity()).toList();
  }
}
