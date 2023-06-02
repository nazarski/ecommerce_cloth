import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/order_model/order_model.dart';

class ManageOrdersData {
  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  ManageOrdersData._();

  static Future<Iterable<OrderModel>> getOrdersFromStatus({
    required String status,
    required int userId,
  }) async {
    final response = await _dio.get('$_endpoint/orders', queryParameters: {
      'filters[user][id]': userId,
      'filters[status]': status,
      'populate[orderedProducts][product]': '*'
    });
    final rawData = List<Map<String, dynamic>>.from(response.data['data']);
    return rawData.map((e) => OrderModel.fromMap(e['attributes']));
  }
  static Future<Iterable<OrderModel>> getAllOrders({
    required int userId
}) async {
    final response = await _dio.get('$_endpoint/orders', queryParameters: {
      'filters[user][id]': userId,
    });
    print(response);
    final rawData = List<Map<String, dynamic>>.from(response.data['data']);
    return rawData.map((e) => OrderModel.fromMap(e['attributes']));
  }
}
