
import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/core/enums/sort_type.dart';
import 'package:ecommerce_cloth/core/utils/helpers/data_helpers.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/product_model/product_model.dart';

class ManageProductsData {
  ManageProductsData._();

  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  static Future<List<ProductModel>> getProductsFromDate(
      DateTime startDate) async {
    final response = await _dio.get('$_endpoint/products', queryParameters: {
      'filters[additionDate][\$gt]':
          '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
      'populate': '*',
    });
    final values = List<Map<String, dynamic>>.from(response.data['data']);
    if (values.isEmpty) {
      return getProductsFromDate(
        startDate.subtract(
          const Duration(
            days: 7,
          ),
        ),
      );
    }
    final result = values.map((e) {
      return ProductModel.fromMap(e);
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
  
  static Future<ProductModel> getProductById({required String productId}) async {
    final response = await _dio.get('$_endpoint/products?filters[productId]=$productId&populate=*');
    final values = List<Map<String, dynamic>>.from(response.data['data']);

    return ProductModel.fromMap(values.first);
}

  static Future<List<ProductModel>> getProductsByFilterValues({
    required int fromPrice,
    required int toPrice,
    required List<String> sizes,
    required List<String> colors,
    required List<String> brandNames,
    required List<String> productTypes,
    required int page,
    required SortType sortType,
  }) async {
    // dont forget to fix priceQuery
    final priceQuery = generatePriceQuery(fromPrice, toPrice);
    final brandQuery = generateBrandNameQuery(brandNames);
    final sizeQuery = generateSizesQuery(sizes);
    final productTypesQuery = generateProductTypesQuery(productTypes);
    final colorsQuery = generateColorsQuery(colors);

    final response = await _dio.get(
      '$_endpoint/products',
      queryParameters: {
        ...priceQuery,
        ...brandQuery,
        ...sizeQuery,
        ...productTypesQuery,
        'sort': _sortTypes[sortType],
        'pagination[page]': page,
        'pagination[pageSize]': 10,
        'populate': '*',
      },
    );
    final values = List<Map<String, dynamic>>.from(response.data['data']);
    final result = values.map((e) {
      return ProductModel.fromMap(e);
    }).toList();
    return result;
  }

  static Future<List<ProductModel>> getLimitedProductsByFilterValue({
    required int fromPrice,
    required int toPrice,
    required List<String> sizes,
    required List<String> colors,
    required List<String> productTypes,
    required String productId,
  }) async {
    final priceQuery = generatePriceQuery(fromPrice, toPrice);
    final sizeQuery = generateSizesQuery(sizes);
    final productTypesQuery = generateProductTypesQuery(productTypes);
    final colorsQuery = generateColorsQuery(colors);

    final response = await _dio.get(
      '$_endpoint/products',
      queryParameters: {
        ...priceQuery,
        ...sizeQuery,
        ...productTypesQuery,
        'filters[productId][\$ne]': productId,
        'pagination[pageSize]': 12,
        'populate': '*',
      },
    );
    final values = List<Map<String, dynamic>>.from(response.data['data']);
    final result = values.map((e) {
      return ProductModel.fromMap(e);
    }).toList();
    return result;
  }

  static const _sortTypes = {
    SortType.novelty: 'additionDate:desc',
    SortType.priceASC: 'price',
    SortType.priceDESC: 'price:desc',
    SortType.saleFirst: 'sale',
  };
}
