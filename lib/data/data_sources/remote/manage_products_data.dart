import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/product_model/product_model.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';

class ManageProductsData {
  ManageProductsData._();

  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  static Future<List<ProductModel>> getProductsFromDate(
      DateTime startDate) async {
    final response = await _dio.get('$_endpoint/products', queryParameters: {
      'filters[additionDate][\$gt]':
          '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
      'populate': '*'
    });
    final values = List<Map<String, dynamic>>.from(response.data['data']);
    if (values.isEmpty) {
      return getProductsFromDate(startDate.subtract(const Duration(days: 7)));
    }
    final result = values.map((e) {
      return ProductModel.fromMap(e['attributes']);
    }).toList();
    return result;
  }

  static Future<List<String>> getProductTypes(
      {required String productGroup,
      required String attribute,
      required String categoryId}) async {
    final response =
        await _dio.get('$_endpoint/product-types', queryParameters: {
      'filters[products][attributes][title]': attribute,
      'filters[productGroups][groupTitle]': productGroup,
      'filters[productGroups][category][categoryId]': categoryId,
      'fields[0]': 'typeName',
    });
    final values = List<Map<String, dynamic>>.from(response.data['data']);
    final data =
        values.map((e) => e['attributes']['typeName'] as String).toList();
    return data;
  }

  static Future<List<ProductModel>> getProductsByFilterValues({
    required int fromPrice,
    required int toPrice,
    required List<String> sizes,
    required List<String> colors,
    required List<String> brandNames,
    required List<String> productTypes,
    required int page,
  }) async {
    // dont forget to fix priceQuery
    final priceQuery = {
      'filters[price][\$lte]': toPrice,
      'filters[price][\$gte]': fromPrice,
    };
    final brandQuery = {
      for (int i = 0; i < brandNames.length; i++)
        'filters[brand][brandName][$i]': brandNames[i]
    };
    final sizeQuery = {
      for (int i = 0; i < sizes.length; i++)
        'filters[availableQuantity][size][$i]': sizes[i]
    };
    final productTypesQuery = {
      for (int i = 0; i < productTypes.length; i++)
        'filters[productType][typeName][$i]': productTypes[i]
    };
    print(
      {
        ...priceQuery,
        ...brandQuery,
        ...sizeQuery,
        ...productTypesQuery,
        'pagination[page]': page,
        'pagination[pageSize]': 10,
        'populate': '*',
      },
    );
    final response = await _dio.get(
      '$_endpoint/products',
      queryParameters: {
        ...priceQuery,
        ...brandQuery,
        ...sizeQuery,
        ...productTypesQuery,
        'pagination[page]': page,
        'pagination[pageSize]': 10,
        'populate': '*',
      },
    );
    final values = List<Map<String, dynamic>>.from(response.data['data']);
    final result = values.map((e) {
      return ProductModel.fromMap(e['attributes']);
    }).toList();
    return result;
  }

  static Future<List<ProductEntity>> testPagination(int page) async {
    final response = await _dio.get('$_endpoint/products', queryParameters: {
      'pagination[page]': page,
      'pagination[pageSize]': 10,
      'populate': '*'
    });
    final values = List<Map<String, dynamic>>.from(response.data['data']);
    final result = values.map((e) {
      return ProductModel.fromMap(e['attributes']).toEntity();
    }).toList();
    return result;
  }
}
