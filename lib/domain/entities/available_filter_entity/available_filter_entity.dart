import 'package:ecommerce_cloth/domain/entities/color_entity/color_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AvailableFilterEntity extends Equatable {
  final List<String> sizes;
  final RangeValues priceRange;
  final List<ColorEntity> colors;

  const AvailableFilterEntity({
    this.sizes = const [],
    required this.priceRange,
    required this.colors,
  });

  @override
  List<Object?> get props => [
        sizes,
        priceRange,
        colors,
      ];

  AvailableFilterEntity copyWith({
    List<String>? sizes,
    RangeValues? priceRange,
    List<ColorEntity>? colors,
  }) {
    return AvailableFilterEntity(
      sizes: sizes ?? this.sizes,
      priceRange: priceRange ?? this.priceRange,
      colors: colors ?? this.colors,
    );
  }
}
