import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';

class PromoCodeModel {
  final int discount;
  final String promoColor;
  final String promoImage;
  final String promoText;
  final String title;

  const PromoCodeModel({
    required this.discount,
    required this.promoColor,
    required this.promoImage,
    required this.promoText,
    required this.title,
  });

  @override
  String toString() {
    return 'PromoCodeModel{'
        'discount: $discount, '
        'promoColor: $promoColor, '
        'promoImage: $promoImage, '
        'promoText: $promoText, '
        'title: $title,'
        '}';
  }

  PromoCodeEntity toEntity() {
    return PromoCodeEntity(
      discount: discount,
      promoColor: promoColor,
      promoImage: promoImage,
      promoText: promoText,
      title: title,
    );
  }

  factory PromoCodeModel.fromEntity({required PromoCodeEntity entity}) {
    return PromoCodeModel(
      discount: entity.discount,
      promoColor: entity.promoColor,
      promoImage: entity.promoImage,
      promoText: entity.promoText,
      title: entity.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'discount': discount,
      'promoColor': promoColor,
      'promoImage': promoImage,
      'promoText': promoText,
      'title': title,
    };
  }

  factory PromoCodeModel.fromMap(Map<String, dynamic> map) {
    return PromoCodeModel(
      discount: map['discount'] as int,
      promoColor: map['promoColor'] as String,
      promoImage: map['promoImage'] as String,
      promoText: map['promoText'] as String,
      title: map['title'] as String,
    );
  }
}
