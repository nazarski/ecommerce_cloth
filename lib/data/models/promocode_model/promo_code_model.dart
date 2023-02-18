class PromoCodeModel{
final int discount;
final String promoColor;
final String promoImage;
final String promoText;
final String title;

//<editor-fold desc="Data Methods">
  const PromoCodeModel({
    required this.discount,
    required this.promoColor,
    required this.promoImage,
    required this.promoText,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PromoCodeModel &&
          runtimeType == other.runtimeType &&
          discount == other.discount &&
          promoColor == other.promoColor &&
          promoImage == other.promoImage &&
          promoText == other.promoText &&
          title == other.title);

  @override
  int get hashCode =>
      discount.hashCode ^
      promoColor.hashCode ^
      promoImage.hashCode ^
      promoText.hashCode ^
      title.hashCode;

  @override
  String toString() {
    return 'PromoCodeModel{ discount: $discount, promoColor: $promoColor, promoImage: $promoImage, promoText: $promoText, title: $title,}';
  }

  PromoCodeModel copyWith({
    int? discount,
    String? promoColor,
    String? promoImage,
    String? promoText,
    String? title,
  }) {
    return PromoCodeModel(
      discount: discount ?? this.discount,
      promoColor: promoColor ?? this.promoColor,
      promoImage: promoImage ?? this.promoImage,
      promoText: promoText ?? this.promoText,
      title: title ?? this.title,
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

//</editor-fold>
}