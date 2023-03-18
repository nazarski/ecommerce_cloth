import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/models/color_model/color_model.dart';

import 'strapi_initialize.dart';

class ManageFilterValuesData {
  ManageFilterValuesData._();

  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  static Future<int> getMaxPriceByTypes({
    required List<String> productTypes,
  }) async {
    final productTypesQuery = _generateProductTypesQuery(productTypes);
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
    final productTypesQuery = _generateProductTypesQuery(productTypes);
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

  static Map<String, String> _generateProductTypesQuery(List<String> types) {
    return {
      for (int i = 0; i < types.length; i++)
        'filters[productType][typeName][$i]': types[i]
    };
  }
}
