import 'package:ecommerce_cloth/data/models/color_model/color_model.dart';

abstract class ManageFilterValuesRepository {
  Future<int> getMaxPriceByTypes({
    required List<String> productTypes,
  });

  Future<int> getMinPriceByTypes({
    required List<String> productTypes,
  });

  Future<List<String>> getAllBrands();

  Future<List<ColorModel>> getColorsList();
  Future<List<String>> getBrandsByValue(String searchValue);
}
