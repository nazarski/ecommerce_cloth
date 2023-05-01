import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';

class RatingModel {
  final int id;
  final int totalReviews;
  final double averageRating;
  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;

  const RatingModel({
    required this.id,
    required this.totalReviews,
    required this.averageRating,
    required this.oneStar,
    required this.twoStar,
    required this.threeStar,
    required this.fourStar,
    required this.fiveStar,
  });

  @override
  String toString() {
    return 'RatingModel{ id: $id, totalReview: $totalReviews, averageRating: $averageRating, oneStar: $oneStar, twoStar: $twoStar, threeStar: $threeStar, fourStar: $fourStar, fiveStar: $fiveStar,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'totalReviews': totalReviews,
      'averageRating': averageRating,
      'oneStar': oneStar,
      'twoStar': twoStar,
      'threeStar': threeStar,
      'fourStar': fourStar,
      'fiveStar': fiveStar,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      id: map['id'] as int,
      totalReviews: map['totalReviews'] as int,
      averageRating: map['averageRating'].toDouble(),
      oneStar: map['oneStar'] as int,
      twoStar: map['twoStar'] as int,
      threeStar: map['threeStar'] as int,
      fourStar: map['fourStar'] as int,
      fiveStar: map['fiveStar'] as int,
    );
  }

  RatingEntity toEntity() {
    return RatingEntity(
      id: id,
      totalReviews: totalReviews,
      averageRating: averageRating,
      oneStar: oneStar,
      twoStar: twoStar,
      threeStar: threeStar,
      fourStar: fourStar,
      fiveStar: fiveStar,
    );
  }

  factory RatingModel.fromEntity({required RatingEntity entity}) {
    return RatingModel(
      id: entity.id,
      totalReviews: entity.totalReviews,
      averageRating: entity.averageRating,
      oneStar: entity.oneStar,
      twoStar: entity.twoStar,
      threeStar: entity.threeStar,
      fourStar: entity.fourStar,
      fiveStar: entity.fiveStar,
    );
  }
}
