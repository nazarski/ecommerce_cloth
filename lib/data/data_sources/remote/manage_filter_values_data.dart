import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/core/utils/helpers/data_helpers.dart';
import 'package:ecommerce_cloth/data/models/color_model/color_model.dart';

import 'strapi_initialize.dart';

class ManageFilterValuesData {
  ManageFilterValuesData._();

  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  static Future<int> getMaxPriceByTypes({
    required List<String> productTypes,
  }) async {
    final productTypesQuery = generateProductTypesQuery(productTypes);
    final response = await _dio.get('$_endpoint/products', queryParameters: {
      ...productTypesQuery,
      'sort': 'price:desc',
      'pagination[limit]': '1',
      'fields': 'price',
    });
    return response.data['data'].first['attributes']['price'];
  }

  static Future<int> getMinPriceByTypes({
    required List<String> productTypes,
  }) async {
    final productTypesQuery = generateProductTypesQuery(productTypes);
    final response = await _dio.get('$_endpoint/products', queryParameters: {
      ...productTypesQuery,
      'sort': 'price',
      'pagination[limit]': '1',
      'fields': 'price',
    });
    return response.data['data'].first['attributes']['price'];
  }

  static Future<List<String>> getBrands() async {
    final response = await _dio.get('$_endpoint/brands', queryParameters: {
      'fields': 'brandName',
    });
    final converted = List<Map<String, dynamic>>.from(response.data['data']);
    return converted
        .map((e) => e['attributes']['brandName'].toString())
        .toList();
  }

  static Future<List<ColorModel>> getColorsList() async {
    final response = await _dio.get('$_endpoint/colors-table');
    final listOfValues = List<Map<String, dynamic>>.from(
      response.data['data']['attributes']['table'],
    );
    return listOfValues.map((e) => ColorModel.fromMap(e)).toList();
  }

  static Future<List<String>> getBrandsByValue(String searchValue) async {
    final response = await _dio.get('$_endpoint/brands', queryParameters: {
      'filters[brandName][\$contains]': searchValue,
      'fields': 'brandName',
    });
    final converted = List<Map<String, dynamic>>.from(response.data['data']);
    return converted
        .map((e) => e['attributes']['brandName'].toString())
        .toList();
  }
}
