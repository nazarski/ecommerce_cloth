import 'package:ecommerce_cloth/data/repositories/manage_products_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_reviews_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_reviews/manage_reviews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manageReviews = ManageReviews(
  ManageReviewsRepositoryImpl(),
  const ManageProductsRepositoryImpl(),
);
final productByIdProvider = FutureProvider.family<ProductEntity, String>((ref, productId) async {
  final product = await manageReviews.getProductByReview(productId: productId);
  return product;
});
