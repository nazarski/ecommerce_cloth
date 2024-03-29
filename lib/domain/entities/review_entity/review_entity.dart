import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int productSystemId;
  final List<String> reviewThumbnailPictures;
  final String reviewId;
  final int helpful;
  final String productId;
  final DateTime publicationDate;
  final int userId;
  final String review;
  final List<String> reviewPictures;
  final String userAvatar;
  final String userName;
  final double rating;

  const ReviewEntity({
    this.productSystemId = 0,
    this.reviewThumbnailPictures = const [],
    this.rating = 0.0,
    this.reviewId = '',
    this.helpful = 0,
    this.productId = '',
    required this.publicationDate,
    this.userId = 0,
    this.review = '',
    this.reviewPictures = const [],
    this.userAvatar = '',
    this.userName = '',
  });

  @override
  List<Object?> get props => [
        productSystemId,
        reviewThumbnailPictures,
        rating,
        reviewId,
        helpful,
        productId,
        publicationDate,
        userId,
        review,
        reviewPictures,
        userAvatar,
        userName,
      ];

  ReviewEntity copyWith({
    int? productSystemId,
    List<String>? reviewThumbnailPictures,
    String? reviewId,
    int? helpful,
    String? productId,
    DateTime? publicationDate,
    int? userId,
    String? review,
    List<String>? reviewPictures,
    String? userAvatar,
    String? userName,
    double? rating,
  }) {
    return ReviewEntity(
      productSystemId: productSystemId ?? this.productSystemId,
      reviewThumbnailPictures:
          reviewThumbnailPictures ?? this.reviewThumbnailPictures,
      reviewId: reviewId ?? this.reviewId,
      helpful: helpful ?? this.helpful,
      productId: productId ?? this.productId,
      publicationDate: publicationDate ?? this.publicationDate,
      userId: userId ?? this.userId,
      review: review ?? this.review,
      reviewPictures: reviewPictures ?? this.reviewPictures,
      userAvatar: userAvatar ?? this.userAvatar,
      userName: userName ?? this.userName,
      rating: rating ?? this.rating,
    );
  }
}
