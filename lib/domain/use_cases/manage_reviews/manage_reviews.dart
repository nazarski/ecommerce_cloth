import 'dart:developer';

import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_reviews_repository.dart';
import 'package:image_picker/image_picker.dart';

class ManageReviews {
  final ManageReviewsRepository _reviewsRepository;

  ManageReviews(this._reviewsRepository);

  final ImagePicker _picker = ImagePicker();

  Future<List<ReviewEntity>> getAllReviews({required String productId}) async {
    return await _reviewsRepository.getAllProductReviews(productId: productId);
  }

  List<ReviewEntity> filterReviewsWherePhoto(
      {required List<ReviewEntity> reviews}) {
    return reviews
        .where((element) => element.reviewThumbnailPictures.isNotEmpty)
        .toList();
  }

  Future<List<String>> pickImageFromGallery() async {
    final List<XFile> listOfImages = await _picker.pickMultiImage();
    if (listOfImages.length >= 5) {
      return listOfImages.sublist(0, 5).map((e) => e.path).toList();
    }
    return listOfImages.map((e) => e.path).toList();
  }

  Future<List<String>> pickImageFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    return photo == null ? [] : [photo.path];
  }

  Future<List<String>> pickImage(ImageSource source) async {
    switch (source) {
      case ImageSource.camera:
        return await pickImageFromCamera();
      case ImageSource.gallery:
        return pickImageFromGallery();
    }
  }

  Future<void> createReview(ReviewEntity review, String jwt, int systemId,
      RatingEntity rating) async {
    _reviewsRepository.addReview(
      systemId: systemId,
      publicationDate: review.publicationDate,
      userId: review.userId,
      review: review.review,
      reviewPictures: review.reviewPictures,
      rating: review.rating.toInt(),
      jwt: jwt,
    );
    _updateProductRating(rating, systemId, review.rating.toInt(), jwt);
  }

  Future<void> _updateProductRating(
      RatingEntity rating, int productSystemId, int rated, String jwt) async {
    final toEditable = {
      "5_star": rating.fiveStar,
      "4_star": rating.fourStar,
      "3_star": rating.threeStar,
      "2_star": rating.twoStar,
      "1_star": rating.oneStar,
    };
    toEditable['${rated}_star'] = toEditable['${rated}_star']! + 1;

    final int totalReviews = rating.totalReviews + 1;
    int sumRatings = 0;
    for (int i = 1; i <= 5; i++) {
      sumRatings += i * toEditable['${i}_star']!;
    }
    final double averageRating = sumRatings / totalReviews;
    final newRating = rating.copyWith(
      oneStar: toEditable['1_star'],
      twoStar: toEditable['2_star'],
      threeStar: toEditable['3_star'],
      fourStar: toEditable['4_star'],
      fiveStar: toEditable['5_star'],
      totalReviews: totalReviews,
      averageRating: averageRating,
    );

    await _reviewsRepository.updateProductRating(
      rating: newRating,
      productSystemId: productSystemId,
      jwt: jwt,
    );
  }
}
