import 'package:equatable/equatable.dart';

class PromoCodeEntity extends Equatable{
  final int discount;
  final String promoColor;
  final String promoImage;
  final String promoText;
  final String title;

  const PromoCodeEntity({
    required this.discount,
    required this.promoColor,
    required this.promoImage,
    required this.promoText,
    required this.title,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    discount,
    promoColor,
    promoImage,
    promoText,
    title,
  ];

}