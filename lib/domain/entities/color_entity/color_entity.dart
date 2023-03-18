import 'dart:ui';

import 'package:equatable/equatable.dart';

class ColorEntity extends Equatable {
  final String colorString;
  final Color colorValue;

  const ColorEntity({
    required this.colorString,
    required this.colorValue,
  });

  @override
  List<Object> get props => [
    colorString,
    colorValue,
  ];
}
