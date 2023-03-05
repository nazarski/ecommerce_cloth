import 'package:ecommerce_cloth/domain/entities/category_entity/category_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_categories_repository.dart';

class GetCategories {
  final ManageCategoriesRepository _categoriesRepository;

  const GetCategories(this._categoriesRepository);

  Future<List<CategoryEntity>> getCategories(String attribute) async {
    return await _categoriesRepository.getCategoriesFromAttribute(attribute);
  }

  Future<List<String>> getProductTypes(String categoryId) async {
    final types =
        await _categoriesRepository.getProductTypesFromCategoryId(categoryId);
    return types.isEmpty ? ['Nothing here yet'] : types;
  }
}
