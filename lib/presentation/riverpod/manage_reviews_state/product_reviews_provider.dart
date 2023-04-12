import 'package:ecommerce_cloth/data/repositories/manage_reviews_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_reviews/manage_reviews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _manageReviewsUseCases = ManageReviews(ManageReviewsRepositoryImpl());

final productReviewsProvider = StateNotifierProvider.autoDispose<
    ProductReviewsProvider, AsyncValue<List<ReviewEntity>>>((ref) {
  return ProductReviewsProvider();
});

class ProductReviewsProvider
    extends StateNotifier<AsyncValue<List<ReviewEntity>>> {
  ProductReviewsProvider() : super(const AsyncLoading());
  bool _withPhotoOnly = false;
  List<ReviewEntity>? _reviews;
  int? _systemId;

  Future<void> getReviewsFromProductId(String productId, int systemId) async {
    _systemId ??= systemId;
    try {
      _reviews ??=
          await _manageReviewsUseCases.getAllReviews(productId: productId);
      state = AsyncData(_reviews ?? []);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  void getReviewsWithPhotos(bool value) {
    _withPhotoOnly = value;
    _emitFilteredReviews();
  }

// Strapi failed to filter non-null nested fields
  void _emitFilteredReviews() {
    if (_withPhotoOnly) {
      final filtered = _manageReviewsUseCases.filterReviewsWherePhoto(
          reviews: _reviews ?? []);
      state = AsyncData(filtered);
    } else {
      state = AsyncData(_reviews ?? []);
    }
  }

  int get systemId => _systemId ?? 0;

  bool get withPhotoOnly => _withPhotoOnly;
}
