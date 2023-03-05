import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/category_model/category_model.dart';

class ManageCategoriesData {
  ManageCategoriesData._();

  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  static Future<List<String>?> getAvailableCategories(String attribute) async {
    final response = await _dio.get('$_endpoint/attributes', queryParameters: {
      'filters[title][\$eq]': attribute,
      'populate': 'categories',
    });
    if (response.statusCode == 200) {
      final values = List<Map<String, dynamic>>.from(
          response.data['data'].first['attributes']['categories']['data']);
      final result = values.map((e) {
        return e['attributes']['categoryId'] as String;
      }).toList();
      return result;
    } else {
      log(response.statusCode.toString());
    }
    return null;
  }

  static Future<List<CategoryModel>?> getCategories(List<String> list) async {
    final Map<String, dynamic> searchValue = {};
    for (int i = 0; i < list.length; i++) {
      searchValue.addAll({'filters[categoryId][\$in][$i]': list[i]});
    }
    final response = await _dio.get(
      '$_endpoint/categories',
      queryParameters: {
        ...searchValue,
        'populate': 'categoryImage',
      },
    );
    if (response.statusCode == 200) {
      final values = List<Map<String, dynamic>>.from(response.data['data']);
      final result = values.map((e) {
        return CategoryModel.fromMap(e['attributes']);
      }).toList();
      return result;
    } else {
      log(response.statusCode.toString());
    }
    return null;
  }

  static Future<List<String>?> getProductGroups(String categoryId) async {
    final response = await _dio.get(
      '$_endpoint/categories',
      queryParameters: {
        'filters[categoryId][\$eq]': categoryId,
        'populate': 'productGroups',
      },
    );
    if (response.statusCode == 200) {
      final values = List<Map<String, dynamic>>.from(
          response.data['data'].first['attributes']['productGroups']['data']);
      final result = values.map((e) {
        return e['attributes']['groupTitle'] as String;
      }).toList();
      return result;
    } else {
      log(response.statusCode.toString());
    }
    return null;
  }
}
