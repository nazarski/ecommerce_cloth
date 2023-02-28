import 'package:ecommerce_cloth/data/repositories/manage_categories_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/category_entity/category_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_categories/get_categories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const getCategories = GetCategories(ManageCategoriesRepositoryImpl());

final categoriesProvider =
    FutureProvider.family<List<CategoryEntity>, String>((ref, attribute) async {
  final result = await getCategories.getCategories(attribute);
  return result;
});
