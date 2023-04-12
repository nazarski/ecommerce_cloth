import 'package:ecommerce_cloth/data/data_sources/remote/manage_reviews_data.dart';
import 'package:ecommerce_cloth/data/models/rating_model/rating_model.dart';
import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_reviews_repository.dart';

class ManageReviewsRepositoryImpl implements ManageReviewsRepository {
  @override
  Future<void> addReview({
    required int systemId,
    required DateTime publicationDate,
    required int userId,
    required String review,
    required List<String> reviewPictures,
    required int rating,
    required String jwt,
  }) async {
    try {
      await ManageReviewsData.addReview(
        systemId: systemId,
        publicationDate: publicationDate,
        userId: userId,
        review: review,
        reviewPictures: reviewPictures,
        rating: rating,
        jwt: jwt,
      );
    } on Exception catch (e) {
      throw Future.error(e.toString());
    }
  }

  @override
  Future<void> updateProductRating({
    required RatingEntity rating,
    required int productSystemId,
    required String jwt,
  }) async {
    final ratingModel = RatingModel.fromEntity(entity: rating);
    await ManageReviewsData.updateProductRating(
      ratingModel,
      productSystemId,
      jwt,
    );
  }

  @override
  Future<List<ReviewEntity>> getAllProductReviews(
      {required String productId}) async {
    try {
      final models =
          await ManageReviewsData.getAllProductReviews(productId: productId);
      return models.map((e) => e.toEntity()).toList();
    } on Exception catch (e) {
      throw Future.error(e.toString());
    }
  }

  @override
  Future<void> markAsHelpful() {
    // TODO: implement markAsHelpful
    throw UnimplementedError();
  }
}
