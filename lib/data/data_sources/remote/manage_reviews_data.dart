import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/models/rating_model/rating_model.dart';
import 'package:ecommerce_cloth/data/models/review_model/review_model.dart';

import 'strapi_initialize.dart';

class ManageReviewsData {
  ManageReviewsData._();

  static final _dio = Dio();
  static const _apiEndpoint = StrapiInitialize.apiEndpoint;

  static Future<List<ReviewModel>> getUserReviews({
    required int userId,
  }) async {
    final response = await _dio.get('$_apiEndpoint/reviews', queryParameters: {
      'filters[user][id]': userId,
      'populate': '*',
    });
    final data = response.data;
    if (data == null) {
      throw Exception('Data is null');
    }
    final listOfValues = List<Map<String, dynamic>>.from(
      response.data['data'],
    );
    return listOfValues
        .map(
          (e) => ReviewModel.fromMapUser(e['attributes']),
        )
        .toList();
  }

  static Future<Iterable<ReviewModel>> getAllProductReviews({
    required String productId,
  }) async {
    final response = await _dio.get('$_apiEndpoint/reviews', queryParameters: {
      'filters[product][productId]': productId,
      'populate[images][fields][0]': 'formats',
      'populate[user][fields][1]': 'username',
      'populate[user][populate][photoUrl][formats][thumbnail][fields][2]':
          'url',
      'populate[product][fields][3]': 'productId',
    });
    final listOfValues = List<Map<String, dynamic>>.from(
      response.data['data'],
    );
    return listOfValues.map(
      (e) => ReviewModel.fromMap(
        e['attributes'],
      ),
    );
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
    final options = Options(headers: {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final List<Map<String, dynamic>> imagesList = [];
    if (reviewPictures.isNotEmpty) {
      final imagesData = FormData();
      imagesData.files.addAll(List.generate(reviewPictures.length, (i) {
        return MapEntry('files', MultipartFile.fromFileSync(reviewPictures[i]));
      }));
      final imageResponse = await _dio.post(
        '$_apiEndpoint/upload',
        options: options,
        data: imagesData,
      );
      imagesList.addAll(List<Map<String, dynamic>>.from(imageResponse.data));
    }
    final Map<String, dynamic> data = {
      'reviewId': 'review-${DateTime.now().millisecondsSinceEpoch}',
      'publicationDate': publicationDate.toIso8601String(),
      'user': userId,
      'product': systemId,
      'review': review,
      'rating': rating,
      'images': imagesList.map((e) => e['id']).toList()
    };
    await _dio.post(
      '$_apiEndpoint/reviews',
      data: {'data': data},
      options: options,
    );
  }

  static Future<void> updateProductRating(
      RatingModel rating, int ratingId, String jwt) async {
    final options = Options(headers: {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final data = rating.toMap();
    log(data.toString());
    final response = await _dio.put(
      '$_apiEndpoint/products/$ratingId',
      data: {
        'data': {'rating': data}
      },
      options: options,
    );
    log(response.realUri.toString());
    log(response.data.toString());
  }
}
