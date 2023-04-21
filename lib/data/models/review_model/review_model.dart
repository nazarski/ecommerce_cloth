import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';

class ReviewModel {
  final int productSystemId;
  final String reviewId;
  final int helpful;
  final String productId;
  final DateTime publicationDate;
  final int userId;
  final String review;
  final Iterable reviewPictures;
  final Iterable reviewThumbnailPictures;
  final String userAvatar;
  final String userName;
  final double rating;

  const ReviewModel({
    required this.productSystemId,
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
  String toString() {
    return 'ReviewModel{'
        'reviewThumbnailPictures: $reviewThumbnailPictures,'
        'rating:$rating,'
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
      productSystemId: productSystemId,
      reviewThumbnailPictures: List<String>.from(reviewThumbnailPictures),
      rating: rating,
      reviewId: reviewId,
      helpful: helpful,
      productId: productId,
      publicationDate: publicationDate,
      userId: userId,
      review: review,
      reviewPictures: List<String>.from(reviewPictures),
      userAvatar: userAvatar,
      userName: userName,
    );
  }

  factory ReviewModel.fromEntity({required ReviewEntity entity}) {
    return ReviewModel(
      productSystemId: entity.productSystemId,
      reviewThumbnailPictures: entity.reviewThumbnailPictures,
      rating: entity.rating,
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
      'reviewThumbnailPictures': reviewThumbnailPictures,
      'rating': rating,
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
      reviewThumbnailPictures: map['images']['data']?.map((e) {
        return StrapiInitialize.endpoint +
            e['attributes']['formats']['thumbnail']['url'];
      }) ??
          [],
      rating: map['rating'].toDouble(),
      reviewId: map['reviewId'] as String,
      helpful: map['helpful'] as int,
      productSystemId: map['product']['data']['id'],
      productId: map['product']['data']['attributes']['productId'],
      publicationDate: DateTime.parse(map['publicationDate']),
      userId: map['user']['data']?['attributes']['id'] ?? 0,
      review: map['review'] as String,
      reviewPictures: map['images']['data']?.map((e) {
        return StrapiInitialize.endpoint +
            e['attributes']['formats']['medium']['url'];
      }) ??
          [],
      userAvatar: map['user']['data']['attributes']['photoUrl']['data'] == null
          ? ''
          : StrapiInitialize.endpoint +
          map['user']['data']['attributes']['photoUrl']?['data']
          ['attributes']['formats']['thumbnail']['url'],
      userName: map['user']['data']?['attributes']['username'] ?? 'Anonymous',
    );
  }

  factory ReviewModel.fromMapUser(Map<String, dynamic> map) {
    return ReviewModel(
      reviewThumbnailPictures: map['images']?['data']?.map((e) {
        return StrapiInitialize.endpoint +
            e['attributes']['formats']?['thumbnail']?['url'];
      })?.toList() ?? [],
      rating: map['rating']?.toDouble() ?? 0,
      reviewId: map['reviewId'] as String? ?? '',
      helpful: map['helpful'] as int? ?? 0,
      productSystemId: map['product']?['data']?['id'] ?? 0,
      productId: map['product']?['data']?['attributes']?['productId'] ?? '',
      publicationDate: DateTime.tryParse(map['publicationDate'] ?? '') ?? DateTime.now(),
      userId: map['user']?['data']?['attributes']?['id'] ?? 0,
      review: map['review'] as String? ?? '',
      reviewPictures: map['images']?['data']
          ?.map((e) => StrapiInitialize.endpoint + e['attributes']['formats']?['medium']?['url'])
          ?.toList() ??
          [],
      userAvatar: map['user']?['data']?['attributes']?['avatarUrl'] == null
          ? ''
          : StrapiInitialize.endpoint +
          map['user']?['data']?['attributes']?['avatarUrl'] ?? '',
      userName: map['user']?['data']?['attributes']?['username'] ?? 'Anonymous',
    );
  }
}
