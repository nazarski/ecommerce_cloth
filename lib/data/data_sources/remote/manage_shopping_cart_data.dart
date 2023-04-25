import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_cart_item_model.dart';

class ManageShoppingCartData {
  ManageShoppingCartData._();

  static final _dio = Dio();
  static const _apiEndpoint = StrapiInitialize.apiEndpoint;

  static Future<void> createUserCart(
      {required int userId, required String jwt}) async {
    final options = Options(headers: {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    final response = await _dio.post(
      '$_apiEndpoint/shopping-carts',
      data: {
        'data': {
          'user': "$userId",
        },
      },
      options: options,
    );
  }

  static Future<int> createCartItem({
    required int productSystemId,
    required int quantity,
    required String size,
  }) async {
    final response = await _dio.post('$_apiEndpoint/cart-items', data: {
      'data': {
        'product': productSystemId,
        'size': size,
        'quantity': quantity,
      }
    });
    return response.data['data']['id'];
  }

  static Future<void> deleteCartItemFromId({required cartItemId}) async {
    await _dio.delete('$_apiEndpoint/cart-items/$cartItemId');
  }

  static Future<Iterable<UserCartItemModel>> getAllCartItems(
      {required int userId}) async {
    final response =
        await _dio.get('$_apiEndpoint/users/$userId', queryParameters: {
      'fields': 'id',
      'populate[shoppingCart][fields]': 'id',
      'populate[shoppingCart][populate][cartItems][populate][product][populate]':
          '*',
    });
    final list = List<Map<String, dynamic>>.from(
        response.data['shoppingCart']['cartItems']);
    return list.map((e) => UserCartItemModel.fromMap(e));
  }

  static Future<void> bindIdWithShoppingCart({
    required int cartItemId,
    required int userId,
  }) async {
    final shoppingCartIdResponse =
        await _dio.get('$_apiEndpoint/users/$userId', queryParameters: {
      'fields': 'id',
      'populate[shoppingCart][fields]': 'id',
    });
    final shoppingCartId = shoppingCartIdResponse.data['shoppingCart']['id'];

    final cartItemsIdsResponse = await _dio
        .get('$_apiEndpoint/shopping-carts/$shoppingCartId', queryParameters: {
      'fields': 'id',
      'populate[cartItems][fields]': 'id',
    });
    final List<int> cartItemsIds = List<Map<String, dynamic>>.from(
            cartItemsIdsResponse.data['data']['attributes']['cartItems']
                ['data'])
        .map((e) => e['id'] as int)
        .toList();

    await _dio.put('$_apiEndpoint/shopping-carts/$shoppingCartId', data: {
      'data': {
        'cartItems': cartItemsIds..add(cartItemId),
      }
    });
  }
}
