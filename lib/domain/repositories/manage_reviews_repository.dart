import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';

abstract class ManageReviewsRepository {
  Future<List<ReviewEntity>> getAllProductReviews({
    required String productId,
  });

  Future<void> markAsHelpful();

  Future<void> updateProductRating({
    required RatingEntity rating,
    required int productSystemId,
    required String jwt,
  });

  Future<void> addReview({
    required int systemId,
    required DateTime publicationDate,
    required int userId,
    required String review,
    required List<String> reviewPictures,
    required int rating,
    required String jwt,
  });
}
