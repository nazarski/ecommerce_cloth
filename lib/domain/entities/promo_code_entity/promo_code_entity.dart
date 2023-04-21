import 'package:equatable/equatable.dart';

class PromoCodeEntity extends Equatable{
  final int discount;
  final String promoImage;
  final String promoText;
  final String title;
  final int daysLeft;

  const PromoCodeEntity({
    required this.discount,
    required this.daysLeft,
    required this.promoImage,
    required this.promoText,
    required this.title,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    discount,
    daysLeft,
    promoImage,
    promoText,
    title,
  ];

}