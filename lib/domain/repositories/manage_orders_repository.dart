import 'package:ecommerce_cloth/domain/entities/order_entity/order_entity.dart';

abstract class ManageOrdersRepository {
  Future<List<OrderEntity>> getOrdersByStatus({required String status, required int userId});
}
