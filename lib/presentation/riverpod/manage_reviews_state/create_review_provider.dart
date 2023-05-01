import 'package:ecommerce_cloth/data/repositories/manage_products_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_reviews_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_reviews/manage_reviews.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/product_reviews_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final _manageReviewsUseCases = ManageReviews(
    ManageReviewsRepositoryImpl(), const ManageProductsRepositoryImpl());
final createReviewProvider =
    StateNotifierProvider.autoDispose<CreateReviewProvider, ReviewEntity>(
        (ref) {
  final systemId = ref.read(productReviewsProvider.notifier).systemId;
  final user = ref.read(userInfoProvider);
  return CreateReviewProvider(
    userId: user.id,
    jwt: user.jwt,
    systemId: systemId,
  );
});

class CreateReviewProvider extends StateNotifier<ReviewEntity> {
  CreateReviewProvider({
    required this.systemId,
    required this.userId,
    required this.jwt,
  }) : super(
          ReviewEntity(
            productSystemId: systemId,
            publicationDate: DateTime.now(),
            userId: userId,
          ),
        );
  final int systemId;
  final int userId;
  final String jwt;

  void setRating(int rate) {
    state = state.copyWith(rating: rate.toDouble());
  }

  void addPicture(ImageSource source) async {
    final images = await _manageReviewsUseCases.pickImage(source);
    final reviewPictures = state.reviewPictures.toList();
    if (images.length + reviewPictures.length > 5) {
      state = state.copyWith(
        reviewPictures: [...reviewPictures, ...images].sublist(0, 5),
      );
    } else {
      state = state.copyWith(
        reviewPictures: state.reviewPictures.toList()..addAll(images),
      );
    }
  }

  void removePicture(int i) {
    state = state.copyWith(
      reviewPictures: state.reviewPictures..removeAt(i),
    );
  }

  Future<void> createReview(String review, RatingEntity rating) async {
    _manageReviewsUseCases.createReview(
        state.copyWith(review: review), jwt, systemId, rating);
  }
}
