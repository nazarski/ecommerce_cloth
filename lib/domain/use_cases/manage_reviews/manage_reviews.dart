import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_reviews_repository.dart';

class ManageReviews {
  final ManageReviewsRepository _reviewsRepository;

  const ManageReviews(this._reviewsRepository);

  Future<List<ReviewEntity>> getAllReviews({required String productId}) async {
    return await _reviewsRepository.getAllProductReviews(productId: productId);
  }

  List<ReviewEntity> filterReviewsWherePhoto(
      {required List<ReviewEntity> reviews}) {
    return reviews
        .where((element) => element.reviewThumbnailPictures.isNotEmpty)
        .toList();
  }
}
