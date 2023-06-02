import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_orders_repository.dart';

class ManageOrders {
  final ManageOrdersRepository _repository;

  ManageOrders(this._repository);

  Future<List<OrderEntity>> getOrderByStatus({
    required String status,
    required int userId,
  }) async {
    return await _repository.getOrdersByStatus(
      status: status,
      userId: userId,
    );
  }
  Future<List<OrderEntity>> getAllOrders({
    required int userId,
  }) async {
    return await _repository.getAllOrders(
      userId: userId,
    );
  }
}
