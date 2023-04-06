import 'dart:io';

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
      'populate[user][populate][photoUrl][formats][thumbnail][fields][2]':
          'url',
    });
    final listOfValues = List<Map<String, dynamic>>.from(
      respond.data['data'],
    );
    return listOfValues.map((e) => ReviewModel.fromMap(e['attributes']));
  }

  static Future<void> addReview({
    required int systemId,
    required DateTime publicationDate,
    required int userId,
    required String review,
    required List<String> reviewPictures,
    required int rating,
    required String jwt,
  }) async {
    print('Entered data $jwt');
    final List<MultipartFile> images =
        reviewPictures.map((e) => MultipartFile.fromFileSync(e)).toList();
    print('Created images');
    // final data = FormData.fromMap({
    //   'publicationDate': publicationDate,
    //   'user': userId,
    //   'product': productId,
    //   'review': review,
    //   'rating': rating,
    // });
    // print('Created data: $data');
final data = {
  'data':
  {
    'publicationDate': publicationDate.toString(),
    'user': userId,
    'product': systemId,
    'review': review,
    'rating': rating,
  }
};
    final response = await _dio.post(
      '$_endpoint/reviews',
      data: data,
      options: Options(headers: {
        HttpHeaders.authorizationHeader: 'Bearer $jwt',
        HttpHeaders.contentTypeHeader: 'application/json',
      }),
    );
    print(response.data);
  }
}
