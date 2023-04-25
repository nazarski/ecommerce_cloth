import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';

class ManageShoppingCartData {
  ManageShoppingCartData._();

  final _dio = Dio();
  final _apiEndpoint = StrapiInitialize.apiEndpoint;

  Future<void> createUserCart({required int userInt}) async {
    final response = await _dio.post('$_apiEndpoint/shopping-cart');
    log(response.data.toString());
  }
}
