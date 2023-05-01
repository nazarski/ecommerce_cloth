import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/promocode_model/promo_code_model.dart';

class PromoCodesRemoteData {
  PromoCodesRemoteData._();

  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  static Future<List<PromoCodeModel>> getPromoCodes() async {
    final Response response = await _dio.get(
      '$_endpoint/promocodes',
      queryParameters: {'populate': '*'},
    );
    final todayDate = DateTime.now();
    final values = List<Map<String, dynamic>>.from(response.data['data']);
    final result = values
        .where((map) => DateTime.parse(map['attributes']['estimatedDate'])
            .isAfter(todayDate))
        .map((models) => PromoCodeModel.fromMap(models))
        .toList();
    return result;
  }
}
