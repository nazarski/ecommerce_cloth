import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_address_model.dart';

class AddressesRemoteData {
  AddressesRemoteData._();

  static final _dio = Dio();
  static const _apiEndpoint = StrapiInitialize.apiEndpoint;

  static Future<List<UserAddressModel>> getUserAddresses(
      {required String userId}) async {
    final response =
        await _dio.get('$_apiEndpoint/users/$userId?populate=addresses');
    final addressesResponse =
        List<Map<String, dynamic>>.from(response.data['addresses']);
    final result = addressesResponse.map((element) {
      return UserAddressModel.fromMap(element);
    }).toList();
    result.sort((a, b) => b.primary ? 1 : -1);
    return result;
  }

  static Future<void> addUserAddress({
    required UserAddressModel addressModel,
    required String jwt,
    required String userId,
  }) async {
    final options = Options(headers: {

      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final Map<String, dynamic> data = {
      'user': userId,
      'address': addressModel.address,
      'city': addressModel.city,
      'country': addressModel.country,
      'fullName': addressModel.fullName,
      'primary': addressModel.primary,
      'region': addressModel.region,
      'zipCode': addressModel.zipCode,
    };
    await _dio.post(
      '$_apiEndpoint/addresses',
      data: {'data': data},
      options: options,
    );
  }

  static Future<void> updateUserAddress({
    required UserAddressModel addressModel,
    required String jwt,
    required String userId,
  }) async {
    final options = Options(headers: {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final Map<String, dynamic> data = {
      'user': userId,
      'address': addressModel.address,
      'city': addressModel.city,
      'country': addressModel.country,
      'fullName': addressModel.fullName,
      'primary': addressModel.primary,
      'region': addressModel.region,
      'zipCode': addressModel.zipCode,
    };
    await _dio.put(
      '$_apiEndpoint/addresses/${addressModel.addressId}',
      options: options,
      data: {'data': data},
    );
  }

  static Future<void> setPrimaryAddress({
    required String jwt,
    required String userId,
    required List<UserAddressModel> listOfAddresses,
  }) async {
    final options = Options(headers: {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    for (int addressIndex = 0;
        addressIndex < listOfAddresses.length;
        addressIndex++) {
      final address = listOfAddresses[addressIndex];
      final Map<String, dynamic> data = {
        'user': userId,
        'address': address.address,
        'city': address.city,
        'country': address.country,
        'fullName': address.fullName,
        'primary': address.primary,
        'region': address.region,
        'zipCode': address.zipCode,
      };

      await _dio.put(
        '$_apiEndpoint/addresses/${address.addressId}',
        options: options,
        data: {'data': data},
      );
    }
  }
}
