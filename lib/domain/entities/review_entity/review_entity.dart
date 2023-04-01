import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final List<String> reviewThumbnailPictures;
  final String reviewId;
  final int helpful;
  final String productId;
  final DateTime publicationDate;
  final String userId;
  final String review;
  final List<String> reviewPictures;
  final String userAvatar;
  final String userName;
  final double rating;

  const ReviewEntity({
    required this.reviewThumbnailPictures,
    required this.rating,
    required this.reviewId,
    required this.helpful,
    required this.productId,
    required this.publicationDate,
    required this.userId,
    required this.review,
    required this.reviewPictures,
    required this.userAvatar,
    required this.userName,
  });

  @override
  List<Object?> get props => [
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
    List<String>? reviewThumbnailPictures,
    String? reviewId,
    int? helpful,
    String? productId,
    DateTime? publicationDate,
    String? userId,
    String? review,
    List<String>? reviewPictures,
    String? userAvatar,
    String? userName,
    double? rating,
  }) {
    return ReviewEntity(
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
