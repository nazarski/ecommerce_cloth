import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable{
  final String reviewId;
  final int helpful;
  final String productId;
  final DateTime publicationDate;
  final String userId;
  final String review;
  final List <String> reviewPictures;
  final String userAvatar;
  final String userName;

  const ReviewEntity({
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
  // TODO: implement props
  List<Object?> get props => [
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

}
