import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_cart_item_model.dart';

class ManageFavouritesData {
  ManageFavouritesData._();

  static final Dio _dio = Dio();

  static const String _apiEndpoint = StrapiInitialize.apiEndpoint;

  static Future<Iterable<String>> getFavouriteTypes(
      {required int userId}) async {
    final response =
        await _dio.get('$_apiEndpoint/users/$userId', queryParameters: {
      'fields': 'id',
      'populate[favourites][fields]': 'id',
      'populate[favourites][populate][product][fields]': 'id',
      'populate[favourites][populate][product][populate][productType][fields]':
          'typeName',
    });
    final listOfData =
        List<Map<String, dynamic>>.from(response.data['favourites']);
    return listOfData.map((element) {
      return element['product']['productType']['typeName'].toString();
    });
  }

  static Future<Iterable<UserCartItemModel>> getFavouriteProducts(
      {required int userId}) async {
    final response =
        await _dio.get('$_apiEndpoint/users/$userId', queryParameters: {
      'fields': 'id',
      'populate[favourites][populate][product][populate]': '*',
    });
    print(response.realUri);
    final listOfData =
        List<Map<String, dynamic>>.from(response.data['favourites']);
    return listOfData.map((e) {
      return UserCartItemModel.fromMap(e);
    });
  }

  static Future<int> createCartItem({
    required int productSystemId,
    required int userId,
    required String size,
  }) async {
    final response = await _dio.post('$_apiEndpoint/cart-items', data: {
      'data': {
        'product': productSystemId,
        'size': size,
      }
    });
    return response.data['data']['id'];
  }

  static Future<Iterable<int>> getFavouritesIds({required int userId}) async {
    final response =
        await _dio.get('$_apiEndpoint/users/$userId', queryParameters: {
      "fields": "id",
      'populate[favourites][fields]': 'id',
    });
    final data = List.from(response.data['favourites']);
    return data.map((element) => element['id']);
  }

  static Future<void> addToFavourites({
    required int userId,
    required List<int> newListOfIds,
    required String jwt,
  }) async {
    final options = Options(headers: {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    await _dio.put(
      '$_apiEndpoint/users/$userId',
      data: {'favourites': newListOfIds},
      options: options,
    );
  }

  static Future<int> getCartItemIdFromProductId(
      {required int systemProductId, required int userId}) async {
    final response =
        await _dio.get('$_apiEndpoint/users/$userId', queryParameters: {
      'fields': 'id',
      'populate[favourites][fields]': 'id',
      'populate[favourites][populate][product][fields]': 'id',
      'populate[favourites][filters][product][id]': systemProductId,
    });
    return response.data['favourites'].first['id'] as int;
  }

  static Future<void> deleteCartItemFromId({required cartItemId}) async {
    await _dio.delete('$_apiEndpoint/cart-items/$cartItemId');
  }

// static Future<void> deleteFromFavourites({
//   required int userId,
//   required int systemProductId,
// }) async {
//   final response = await _dio.put(
//     '$_apiEndpoint/users/$userId',
//     data: {
//       "data": {
//         'favourites': [systemProductId]
//       }
//     },
//   );
//   log(response.data.toString());
// }
}
// 'populate[favourites][populate][product][fields]':'id',
