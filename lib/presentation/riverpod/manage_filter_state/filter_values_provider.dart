import 'package:ecommerce_cloth/core/enums/sort_type.dart';
import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterValuesProvider = StateNotifierProvider.autoDispose<
    FilterValuesProvider, ProductFilterEntity>((ref) {
  return FilterValuesProvider();
});

class FilterValuesProvider extends StateNotifier<ProductFilterEntity> {
  FilterValuesProvider() : super(const ProductFilterEntity());

  // void setPriceRange({required int fromPrice, required int toPrice}) {
  //   state = state.copyWith(
  //     fromPrice: fromPrice,
  //     toPrice: toPrice,
  //   );
  // }
  //
  // void setColors({required String color}) {
  //   final Set<String> colors = state.colors;
  //   if (colors.contains(color)) {
  //     colors.remove(color);
  //     state = state.copyWith(colors: colors);
  //   } else {
  //     colors.add(color);
  //     state = state.copyWith(colors: colors);
  //   }
  // }
  // void setSizes({required String size}) {
  //   final List<String> sizes = state.sizes;
  //   if (sizes.contains(size)) {
  //     sizes.remove(size);
  //     state = state.copyWith(sizes: sizes);
  //   } else {
  //     sizes.add(size);
  //     state = state.copyWith(sizes: sizes);
  //   }
  // }
  //
  // void setBrandNames({required String brandName}) {
  //   final List<String> brandNames = state.brandNames;
  //   if (brandNames.contains(brandName)) {
  //     brandNames.remove(brandName);
  //     state = state.copyWith(brandNames: brandNames);
  //   } else {
  //     brandNames.add(brandName);
  //     state = state.copyWith(brandNames: brandNames);
  //   }
  // }

  void acceptReceiver({required ProductFilterEntity receiver}) {
    state = state.copyWith(
      colors: receiver.colors,
      brandNames: receiver.brandNames,
      fromPrice: receiver.fromPrice,
      toPrice: receiver.toPrice,
      sizes: receiver.sizes,
      page: 1,
    );
  }

  void setProductTypes({required List<String> productTypes}) {
    state = state.copyWith(
      productTypes: productTypes,
      page: 1,
    );
  }

  void setSortType({required SortType sortType}) {
    state = state.copyWith(sortType: sortType);
  }

  void setPage({required int page}) {
    state = state.copyWith(page: page);
  }

  ProductFilterEntity get filter => state;
}
