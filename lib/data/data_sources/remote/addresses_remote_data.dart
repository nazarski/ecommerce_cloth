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
    return result;
  }
}
