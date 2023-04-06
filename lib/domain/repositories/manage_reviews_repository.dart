import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';

abstract class ManageReviewsRepository {
  Future<List<ReviewEntity>> getAllProductReviews({
    required String productId,
  });

  Future<void> markAsHelpful();

  Future<void> addReview({
    required String productId,
    required DateTime publicationDate,
    required String userId,
    required String review,
    required List<String> reviewPictures,
    required double rating,
  });
}
