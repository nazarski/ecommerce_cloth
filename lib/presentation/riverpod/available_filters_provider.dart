import 'package:ecommerce_cloth/data/repositories/manage_filter_values_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/available_filter_entity/available_filter_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_filters/manage_filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _getFilters = GetFilters(ManageFilterValuesRepositoryImpl());
final availableFiltersProvider = StateNotifierProvider.autoDispose<FilterValuesProvider,
    AsyncValue<AvailableFilterEntity>>((ref) {
      // ref.watch(availableBrandsProvider);
      return FilterValuesProvider();
    });

class FilterValuesProvider
    extends StateNotifier<AsyncValue<AvailableFilterEntity>> {
  FilterValuesProvider() : super(const AsyncLoading());

  Future<void> getAvailableFilters(List<String> productTypes) async {
    try {
      final filterEntity = await _getFilters.getAvailableFilters(productTypes);
      state = AsyncData(filterEntity);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

final availableBrandsProvider = StateNotifierProvider.autoDispose<BrandsProvider,
    AsyncValue<List<String>>>((ref) => BrandsProvider());

class BrandsProvider
    extends StateNotifier<AsyncValue<List<String>>> {
  BrandsProvider() : super(const AsyncLoading()){
    _getAllBrands();
  }

  Future<void>_getAllBrands()async{
    try {
      final brands = await _getFilters.getAllBrands();
      state = AsyncData(brands);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> searchBrands(String searchValue) async {
    try {
      final brands = await _getFilters.getBrandsByValue(searchValue);
      state = AsyncData(brands);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}