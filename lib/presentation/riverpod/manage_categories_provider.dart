import 'package:ecommerce_cloth/data/repositories/manage_categories_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/category_entity/category_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_categories/get_categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _getCategories = GetCategories(ManageCategoriesRepositoryImpl());

final categoriesProvider =
    FutureProvider.family<List<CategoryEntity>, String>((ref, attribute) async {
  final result = await _getCategories.getCategories(attribute);
  return result;
});

final productGroupsProvider = FutureProvider.family
    .autoDispose<List<String>, String>((ref, categoryId) async {
  final result = await _getCategories.getProductGroups(categoryId);
  return result;
});

// final productGroupsProvider =
//     StateNotifierProvider<ProductGroupsProvider, AsyncValue<List<String>>>(
//         (ref) => ProductGroupsProvider());
//
// class ProductGroupsProvider extends StateNotifier<AsyncValue<List<String>>> {
//   ProductGroupsProvider() : super(const AsyncValue.loading());
//
//   Future<void> selectCategory(String categoryId) async {
//     try {
//       final productGroups = await _getCategories.getProductGroups(categoryId);
//       state = AsyncValue.data(productGroups);
//     } catch (error) {
//       state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
//     }
//   }
// }
