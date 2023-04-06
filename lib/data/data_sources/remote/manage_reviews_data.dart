import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/models/review_model/review_model.dart';

import 'strapi_initialize.dart';

class ManageReviewsData {
  ManageReviewsData._();

  static final _dio = Dio();
  static const _endpoint = StrapiInitialize.apiEndpoint;

  static Future<Iterable<ReviewModel>> getAllProductReviews({
    required String productId,
  }) async {
    final respond = await _dio.get('$_endpoint/reviews', queryParameters: {
      'filters[product][productId]': productId,
      'populate[images][fields][0]': 'formats',
      'populate[user][fields][1]': 'username',
      'populate[user][populate][photoUrl][formats][thumbnail][fields][2]': 'url',
    });
    final listOfValues = List<Map<String, dynamic>>.from(
      respond.data['data'],
    );
    return listOfValues.map((e) => ReviewModel.fromMap(e['attributes']));
  }
  static Future<void> addReview(String productId)async{

  }

// static Future<List<ReviewModel>> getProductReviewsWithPhotoOnly({
//   required String productId,
// }) async {
//   final respond = await _dio.get('$_endpoint/reviews', queryParameters: {
//     'filters[product][productId]': productId,
//     'populate[images][fields][0]': 'formats',
//     'populate[user][fields][1]': 'username',
//     'populate[user][fields][2]': 'avatarUrl',
//   });
//   final listOfValues = List<Map<String,dynamic>>.from(respond.data);
//   return listOfValues.map((e) => ReviewModel.fromMap(e)).toList();
// }
}
