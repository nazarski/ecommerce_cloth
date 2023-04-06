import 'dart:developer';

import 'package:ecommerce_cloth/data/repositories/manage_reviews_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_reviews/manage_reviews.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final _manageReviewsUseCases = ManageReviews(ManageReviewsRepositoryImpl());
final createReviewProvider =
    StateNotifierProvider.autoDispose<CreateReviewProvider, ReviewEntity>(
        (ref) {
  final userId = ref.read(userInfoProvider);
  return CreateReviewProvider(
    userId: userId.id,
    jwt: userId.jwt, systemId: 0,
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
              reviewThumbnailPictures: const [],
              rating: 0,
              reviewId: '',
              helpful: 0,
              productId: '',
              publicationDate: DateTime.now(),
              userId: userId,
              review: '',
              reviewPictures: const [],
              userAvatar: '',
              userName: ''),
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

  Future<void> createReview(String review) async {
    _manageReviewsUseCases.createReview(
      state.copyWith(review: review),
      jwt,
      systemId,
    );
  }
}
