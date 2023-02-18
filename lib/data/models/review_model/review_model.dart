class ReviewModel{
  final String reviewId;
  final int helpful;
  final String productId;
  final int publicationDate;
  final String userId;
  final String review;
  final List <String> reviewPictures;
  final String userAvatar;
  final String userName;

//<editor-fold desc="Data Methods">
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewModel &&
          runtimeType == other.runtimeType &&
          reviewId == other.reviewId &&
          helpful == other.helpful &&
          productId == other.productId &&
          publicationDate == other.publicationDate &&
          userId == other.userId &&
          review == other.review &&
          reviewPictures == other.reviewPictures &&
          userAvatar == other.userAvatar &&
          userName == other.userName);

  @override
  int get hashCode =>
      reviewId.hashCode ^
      helpful.hashCode ^
      productId.hashCode ^
      publicationDate.hashCode ^
      userId.hashCode ^
      review.hashCode ^
      reviewPictures.hashCode ^
      userAvatar.hashCode ^
      userName.hashCode;

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

  ReviewModel copyWith({
    String? reviewId,
    int? helpful,
    String? productId,
    int? publicationDate,
    String? userId,
    String? review,
    List<String>? reviewPictures,
    String? userAvatar,
    String? userName,
  }) {
    return ReviewModel(
      reviewId: reviewId ?? this.reviewId,
      helpful: helpful ?? this.helpful,
      productId: productId ?? this.productId,
      publicationDate: publicationDate ?? this.publicationDate,
      userId: userId ?? this.userId,
      review: review ?? this.review,
      reviewPictures: reviewPictures ?? this.reviewPictures,
      userAvatar: userAvatar ?? this.userAvatar,
      userName: userName ?? this.userName,
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
      publicationDate: map['publicationDate'] as int,
      userId: map['userId'] as String,
      review: map['review'] as String,
      reviewPictures: map['reviewPictures'] as List<String>,
      userAvatar: map['userAvatar'] as String,
      userName: map['userName'] as String,
    );
  }

//</editor-fold>
}