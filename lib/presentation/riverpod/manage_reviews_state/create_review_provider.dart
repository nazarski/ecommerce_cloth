import 'package:ecommerce_cloth/data/repositories/manage_reviews_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_reviews/manage_reviews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final _manageReviewsUseCases = ManageReviews(ManageReviewsRepositoryImpl());
final createReviewProvider =
    StateNotifierProvider.autoDispose<CreateReviewProvider, ReviewEntity>(
        (ref) => CreateReviewProvider());

class CreateReviewProvider extends StateNotifier<ReviewEntity> {
  CreateReviewProvider()
      : super(
          ReviewEntity(
              reviewThumbnailPictures: const [],
              rating: 0,
              reviewId: '',
              helpful: 0,
              productId: '',
              publicationDate: DateTime.now(),
              userId: '',
              review: '',
              reviewPictures: const [],
              userAvatar: '',
              userName: ''),
        );

  void setRating(int rate) {
    state = state.copyWith(rating: rate.toDouble());
  }

  void addPicture(ImageSource source) async {
    final images = await _manageReviewsUseCases.pickImage(source);
    final reviewPictures = state.reviewPictures.toList();
    if (images.length + reviewPictures.length >= 5) {
      state = state.copyWith(
        reviewPictures: [...reviewPictures, ...images].sublist(0, 5),
      );
    }
    state = state.copyWith(
      reviewPictures: state.reviewPictures.toList()..addAll(images),
    );
  }
}
