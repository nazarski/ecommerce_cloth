import 'dart:ui';

import 'package:ecommerce_cloth/domain/entities/color_entity/color_entity.dart';

class ColorModel {
  final String colorString;
  final String colorValue;

  const ColorModel({
    required this.colorString,
    required this.colorValue,
  });

  @override
  String toString() {
    return 'CardModel{ '
        'colorString: $colorString, '
        'colorValue: $colorValue,'
        '}';
  }

  ColorEntity toEntity() {
    return ColorEntity(
      colorString: colorString,
      colorValue: Color(int.parse('FF$colorValue', radix: 16)),
    );
  }

  factory ColorModel.fromMap(Map<String, dynamic> map) {
    return ColorModel(
      colorString: map['colorString'] as String,
      colorValue: map['colorValue'] as String,
    );
  }
}
