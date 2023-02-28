import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/product_model/product_model.dart';

class ManageProductsData {
  ManageProductsData._();
  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.endpoint;

  static Future<List<ProductModel>?> getProductsFromDate(DateTime startDate) async {
    final response = await _dio.get('$_endpoint/products?populate=*&filters[additionDate][\$gt]=${startDate.year}-${startDate.month.toString().padLeft(2,'0')}-${startDate.day.toString().padLeft(2,'0')}');
    if (response.statusCode == 200) {
      final values = List<Map<String, dynamic>>.from(response.data['data']);
      return values.map((e) {
        return ProductModel.fromMap(e['attributes']);
      }).toList();
    }else{
      print(response.statusCode);
    }
    return null;
  }



}
