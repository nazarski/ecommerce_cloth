import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productReviewsProvider = StateNotifierProvider.autoDispose<
    ProductReviewsProvider, AsyncValue<List<ReviewEntity>>>((ref) {
  return ProductReviewsProvider();
});

class ProductReviewsProvider
    extends StateNotifier<AsyncValue<List<ReviewEntity>>> {
  ProductReviewsProvider() : super(const AsyncLoading());
  late final String _productId;
  bool _withPhotoOnly = false;

  Future<void> getReviewsFromProductId({String? productId}) async {
    if (productId != null) _productId = productId;
    try {
      final id = productId;
      state = AsyncData([]);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  void getReviewsWithPhotos(bool value) {
    _withPhotoOnly = value;
    state = const AsyncLoading();
    getReviewsFromProductId();
  }
  bool get withPhotoOnly => _withPhotoOnly;
}
