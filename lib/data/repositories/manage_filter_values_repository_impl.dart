import 'package:ecommerce_cloth/data/data_sources/remote/manage_filter_values_data.dart';
import 'package:ecommerce_cloth/data/models/color_model/color_model.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_filter_values_repository.dart';

class ManageFilterValuesRepositoryImpl implements ManageFilterValuesRepository {
  @override
  Future<List<String>> getAllBrands() async {
    try {
      return await ManageFilterValuesData.getBrands();
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<ColorModel>> getColorsList() async {
    try {
      return await ManageFilterValuesData.getColorsList();
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<int> getMaxPriceByTypes({required List<String> productTypes}) async {
    try {
      return await ManageFilterValuesData.getMaxPriceByTypes(
        productTypes: productTypes,
      );
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<int> getMinPriceByTypes({required List<String> productTypes}) async {
    try {
      return await ManageFilterValuesData.getMinPriceByTypes(
        productTypes: productTypes,
      );
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<String>> getBrandsByValue(String searchValue) async {
    try {
      return await ManageFilterValuesData.getBrandsByValue(searchValue);
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
