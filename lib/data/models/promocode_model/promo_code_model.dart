 import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';

class PromoCodeModel {
  final int discount;

  final String? promoImage;
  final String promoText;
  final String title;
  final int estimatedDate;

  const PromoCodeModel({
    required this.estimatedDate,
    required this.discount,
    required this.promoImage,
    required this.promoText,
    required this.title,
  });

  @override
  String toString() {
    return 'PromoCodeModel{'
    'estimatedDate: $estimatedDate'
        'discount: $discount, '
        'promoImage: $promoImage, '
        'promoText: $promoText, '
        'title: $title,'
        '}';
  }

  PromoCodeEntity toEntity() {
    return PromoCodeEntity(
      discount: discount,
      promoImage: promoImage!,
      promoText: promoText,
      title: title, daysLeft: estimatedDate,
    );
  }

  factory PromoCodeModel.fromEntity({required PromoCodeEntity entity}) {
    return PromoCodeModel(
      discount: entity.discount,
      promoImage: entity.promoImage,
      promoText: entity.promoText,
      title: entity.title, estimatedDate: entity.daysLeft,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'discount': discount,
      'estimatedDate': estimatedDate,
      'promoImage': promoImage,
      'promoText': promoText,
      'title': title,
    };
  }

  factory PromoCodeModel.fromMap(Map<String, dynamic> map) {
    final estimatedDate = DateTime.parse(map['attributes']['estimatedDate'] as String);
    final daysLeft = estimatedDate.difference(DateTime.now()).inDays;
    return PromoCodeModel(
      discount: map['attributes']['discount'] != null ? map['attributes']['discount'] as int : 0,
      promoImage: map['attributes']['promoImage'] != null && map['attributes']['promoImage']['data'] != null
          ? StrapiInitialize.endpoint + map['attributes']['promoImage']['data']['attributes']['formats']['thumbnail']['url']
          : '',
      promoText: map['attributes']['promoValue'] != null ? map['attributes']['promoValue'] as String : '',
      title: map['attributes']['promoTitle'] != null ? map['attributes']['promoTitle'] as String : '', estimatedDate: daysLeft,
    );
  }
}
