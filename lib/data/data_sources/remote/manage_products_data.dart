import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/product_model/product_model.dart';

class ManageProductsData {
  ManageProductsData._();

  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  static Future<List<ProductModel>?> getProductsFromDate(
      DateTime startDate) async {
    final response = await _dio.get('$_endpoint/products', queryParameters: {
      'filters[additionDate][\$gt]':
          '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
      'populate': '*'
    });
    if (response.statusCode == 200) {
      final values = List<Map<String, dynamic>>.from(response.data['data']);
      if (values.isEmpty) {
        return getProductsFromDate(startDate.subtract(const Duration(days: 7)));
      }
      final result = values.map((e) {
        return ProductModel.fromMap(e['attributes']);
      }).toList();
      return result;
    } else {
      log(response.statusCode.toString());
    }
    return null;
  }

  static Future<List<String>?> getProductTypes(
      {required String productGroup,
      required String attribute,
      required String categoryId}) async {
    final response =
        await _dio.get('$_endpoint/product-types', queryParameters: {
      'filters[products][attributes][title]': attribute,
      'filters[productGroups][groupTitle]': productGroup,
      'filters[productGroups][category][categoryId]': categoryId,
      'fields[0]': 'typeName'
    });
    if (response.statusCode == 200) {
      return response.data['data']
          .map((e) => e['attributes']['typeName'])
          .toList();
    } else {
      log(response.statusCode.toString());
    }
    return null;
  }
  static Future<List<String>?> getProductsByFilterValues(
      {
        required List<String> productTypes,
        required int fromPrice,
        required int toPrice,
        required List<String> sizes,
        required List<String> attributes,
        required List<String> brandNames,
      }) async {
    final response =
    await _dio.get('$_endpoint/product-types', queryParameters: {
      // 'filters[products][attributes][title]': attribute,
      // 'filters[productGroups][groupTitle]': productGroup,
      // 'filters[productGroups][category][categoryId]': categoryId,
      // 'fields[0]': 'typeName'
    });
    if (response.statusCode == 200) {
      return response.data['data']
          .map((e) => e['attributes']['typeName'])
          .toList();
    } else {
      log(response.statusCode.toString());
    }
    return null;
  }
}
