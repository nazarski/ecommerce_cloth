import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  final int id;
  final int totalReviews;
  final double averageRating;
  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;

  const RatingEntity({
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
  List<Object> get props => [
        id,
        totalReviews,
        averageRating,
        oneStar,
        twoStar,
        threeStar,
        fourStar,
        fiveStar,
      ];

  RatingEntity copyWith({
    int? id,
    int? totalReviews,
    double? averageRating,
    int? oneStar,
    int? twoStar,
    int? threeStar,
    int? fourStar,
    int? fiveStar,
  }) {
    return RatingEntity(
      totalReviews: totalReviews ?? this.totalReviews,
      averageRating: averageRating ?? this.averageRating,
      oneStar: oneStar ?? this.oneStar,
      twoStar: twoStar ?? this.twoStar,
      threeStar: threeStar ?? this.threeStar,
      fourStar: fourStar ?? this.fourStar,
      fiveStar: fiveStar ?? this.fiveStar, id: id?? this.id,
    );
  }
}
