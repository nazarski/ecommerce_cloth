import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/data/repositories/manare_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_type_find_entity/product_type_find_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_products/get_products.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

const _getProducts = GetProducts(ManageProductsRepositoryImpl());

final newProductsProvider =
    FutureProvider.family<List<ProductEntity>, ProductSliderType>(
        (ref, type) async {
  final result = await _getProducts.getByType(type);
  return result;
});

final collectSearchHierarchyProvider = StateNotifierProvider<
    CollectSearchHierarchyProvider, ProductTypeFindEntity>((_) {
  return CollectSearchHierarchyProvider();
});

class CollectSearchHierarchyProvider
    extends StateNotifier<ProductTypeFindEntity> {
  CollectSearchHierarchyProvider() : super(const ProductTypeFindEntity());

  void addCategoryId({required String categoryId}) {
    state = state.copyWith(
      categoryId: categoryId,
    );
  }

  void addAttribute({required String attribute}) {
    state = state.copyWith(
      attribute: attribute,
    );
  }

  void addProductGroup({required String productGroup}) {
    state = state.copyWith(
      productGroup: productGroup,
    );
  }

  ProductTypeFindEntity get finder => state;
// String get categoryId => state.categoryId;
//
// String get attribute => state.attribute;
//
// String get productGroup => state.productGroup;
}

final productTypesProvider = FutureProvider.family
    .autoDispose<List<String>, ProductTypeFindEntity>((ref, finder) async {
  final List<String> productTypes =
      await _getProducts.getProductTypes(finder: finder);
  ref
      .watch(productListProvider.notifier)
      .setFilter(ProductFilterEntity(productTypes: productTypes));
  return productTypes;
});

// final productTypesProvider =
//     StateNotifierProvider<ProductTypesProvider, AsyncValue<List<String>>>(
//   (ref) => ProductTypesProvider(
//     productListProviderRef: ref.read(productListProvider.notifier),
//     // productListProviderRef: ref.watch(productListProvider.notifier),
//   ),
// );
//
// class ProductTypesProvider extends StateNotifier<AsyncValue<List<String>>> {
//   ProductTypesProvider({required this.productListProviderRef})
//       : super(const AsyncValue.loading());
//   final ProductListProvider productListProviderRef;
//   String? attribute;
//   String? categoryId;
//   late String productGroup;
//
//   Future<void> selectProductGroup(String productGroup) async {
//     try {
//       this.productGroup = productGroup;
//       final List<String> productTypes = await _getProducts.getProductTypes(
//         productGroup: productGroup,
//         attribute: attribute!,
//         categoryId: categoryId!,
//       );
//       state = AsyncValue.data(productTypes);
//       productListProviderRef
//           .setFilter(ProductFilterEntity(productTypes: productTypes));
//     } catch (error) {
//       state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
//     }
//   }
// }

final productListProvider = StateNotifierProvider.autoDispose<
    ProductListProvider, AsyncValue<List<ProductEntity>>>((ref) {
  return ProductListProvider(const ProductFilterEntity());
});

class ProductListProvider
    extends StateNotifier<AsyncValue<List<ProductEntity>>> {
  ProductListProvider(this._filter) : super(const AsyncValue.loading());

  ProductFilterEntity _filter;

  Future<void> _getProductsFromFilter() async {
    try {
      final List<ProductEntity> products =
          await _getProducts.getProductsByFilter(_filter);
      state = AsyncValue.data([...state.value ?? [], ...products]);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.fromString('Didn`t work'));
    }
  }

  void setFilter(ProductFilterEntity newFields) {
    _filter = _filter.copyWith(
      fromPrice: newFields.fromPrice,
      toPrice: newFields.toPrice,
      colors: newFields.colors,
      productTypes: newFields.productTypes,
      sizes: newFields.sizes,
      attributes: newFields.attributes,
      brandNames: newFields.brandNames,
      sortType: newFields.sortType,
      page: newFields.page,
    );
    _getProductsFromFilter();
  }
}

