import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';

class ReviewModel {
  final String reviewId;
  final int helpful;
  final String productId;
  final DateTime publicationDate;
  final String userId;
  final String review;
  final List<String> reviewPictures;
  final String userAvatar;
  final String userName;

  const ReviewModel({
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
  String toString() {
    return 'ReviewModel{'
        'reviewId: $reviewId, '
        'helpful: $helpful, '
        'productId: $productId, '
        'publicationDate: $publicationDate, '
        'userId: $userId, '
        'review: $review, '
        'reviewPictures: $reviewPictures, '
        'userAvatar: $userAvatar, '
        'userName: $userName,'
        '}';
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      reviewId: reviewId,
      helpful: helpful,
      productId: productId,
      publicationDate: publicationDate,
      userId: userId,
      review: review,
      reviewPictures: reviewPictures,
      userAvatar: userAvatar,
      userName: userName,
    );
  }

  factory ReviewModel.fromEntity({required ReviewEntity entity}) {
    return ReviewModel(
      reviewId: entity.reviewId,
      helpful: entity.helpful,
      productId: entity.productId,
      publicationDate: entity.publicationDate,
      userId: entity.userId,
      review: entity.review,
      reviewPictures: entity.reviewPictures,
      userAvatar: entity.userAvatar,
      userName: entity.userName,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'reviewId': reviewId,
      'helpful': helpful,
      'productId': productId,
      'publicationDate': publicationDate,
      'userId': userId,
      'review': review,
      'reviewPictures': reviewPictures,
      'userAvatar': userAvatar,
      'userName': userName,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      reviewId: map['reviewId'] as String,
      helpful: map['helpful'] as int,
      productId: map['productId'] as String,
      publicationDate: map['publicationDate'] as DateTime,
      userId: map['userId'] as String,
      review: map['review'] as String,
      reviewPictures: map['reviewPictures'] as List<String>,
      userAvatar: map['userAvatar'] as String,
      userName: map['userName'] as String,
    );
  }

}
