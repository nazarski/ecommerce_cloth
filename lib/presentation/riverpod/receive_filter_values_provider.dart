import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final receiveFilterValuesProvider =
    StateNotifierProvider.autoDispose<ReceiveFilterValues, ProductFilterEntity>(
        (ref) => ReceiveFilterValues());

class ReceiveFilterValues extends StateNotifier<ProductFilterEntity> {
  ReceiveFilterValues() : super(const ProductFilterEntity());

  void setRange(RangeValues range) {
    state = state.copyWith(
        fromPrice: range.start.toInt(), toPrice: range.end.toInt());
  }

  void selectColor(String color) {
    final colors = state.colors.toSet();
    if (colors.contains(color)) {
      colors.remove(color);
      state = state.copyWith(colors: colors);
    } else {
      colors.add(color);
      state = state.copyWith(colors: colors);
    }
  }
  void selectSize(String size) {
    final sizes = state.sizes.toList();
    if (sizes.contains(size)) {
      sizes.remove(size);
      state = state.copyWith(sizes: sizes);
    } else {
      sizes.add(size);
      state = state.copyWith(sizes: sizes);
    }
  }
  void selectBrand(String size) {
    final brands = state.brandNames.toList();
    if (brands.contains(size)) {
      brands.remove(size);
      state = state.copyWith(brandNames: brands);
    } else {
      brands.add(size);
      state = state.copyWith(brandNames: brands);
    }
  }

}
