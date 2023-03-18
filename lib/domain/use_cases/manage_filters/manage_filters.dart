import 'package:ecommerce_cloth/domain/entities/available_filter_entity/available_filter_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_filter_values_repository.dart';
import 'package:flutter/material.dart';

class GetFilters {
  final ManageFilterValuesRepository _filterRepository;

  const GetFilters(this._filterRepository);

  Future<AvailableFilterEntity> getAvailableFilters(
      List<String> productTypes) async {
    final brands = await _filterRepository.getAllBrands();
    final colors = await _filterRepository.getColorsList();
    final maxPrice =
        await _filterRepository.getMaxPriceByTypes(productTypes: productTypes,);
    final minPrice =
        await _filterRepository.getMinPriceByTypes(productTypes: productTypes,);
    return AvailableFilterEntity(
      brands,
      RangeValues(minPrice.toDouble(), maxPrice.toDouble()),
      colors.map((e) => e.toEntity()).toList(),
    );
  }
}
