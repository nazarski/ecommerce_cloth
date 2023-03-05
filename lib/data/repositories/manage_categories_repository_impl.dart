import 'package:ecommerce_cloth/data/data_sources/remote/manage_categories_data.dart';
import 'package:ecommerce_cloth/domain/entities/category_entity/category_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_categories_repository.dart';

class ManageCategoriesRepositoryImpl implements ManageCategoriesRepository {
  const ManageCategoriesRepositoryImpl();

  @override
  Future<List<CategoryEntity>> getCategoriesFromAttribute(
      String attribute) async {
    try {
      final listOfCategoryIds =
          await ManageCategoriesData.getAvailableCategories(attribute);
      final listOfCategories =
          await ManageCategoriesData.getCategories(listOfCategoryIds!);
      return listOfCategories!.map((e) => e.toEntity()).toList();
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<String>> getProductTypesFromCategoryId(String categoryId) async {
    try {
      final productGroups =
          await ManageCategoriesData.getProductGroups(categoryId);
      return productGroups ?? [];
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
