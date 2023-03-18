import 'package:ecommerce_cloth/domain/entities/color_entity/color_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AvailableFilterEntity extends Equatable {
  final List<String> brands;
  final RangeValues priceRange;
  final List<ColorEntity> colors;

  const AvailableFilterEntity(this.brands, this.priceRange, this.colors);

  @override
  // TODO: implement props
  List<Object?> get props => [
        brands,
        priceRange,
        colors,
      ];
}
