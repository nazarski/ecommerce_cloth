import 'package:ecommerce_cloth/data/data_sources/remote/manage_reviews_data.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_reviews_repository.dart';

class ManageReviewsRepositoryImpl implements ManageReviewsRepository {
  @override
  Future<void> addReview({
    required String productId,
    required DateTime publicationDate,
    required String userId,
    required String review,
    required List<String> reviewPictures,
    required double rating,
  }) async {
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
