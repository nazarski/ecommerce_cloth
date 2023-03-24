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
}
