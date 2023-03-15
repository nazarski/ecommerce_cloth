import 'package:ecommerce_cloth/data/data_sources/remote/manage_products_data.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/entities/product_pagination_entity/product_pagination_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsPaginationController =
    StateNotifierProvider((ref) => ProductsPaginationController());

class ProductsPaginationController
    extends StateNotifier<ProductsPaginationEntity> {
  ProductsPaginationController() : super(ProductsPaginationEntity());


  Future<void> getProductsFromPage() async {
    try {
      final List<ProductEntity> products =
          await ManageProductsData.testPagination(state.page);
      state = state.copyWith(
          listOfProducts: [...state.listOfProducts, ...products],
          page: state.page + 1);
    } catch (error) {
      state = state.copyWith(errorMessage: error.toString());
    }
  }

  void handlePaginationWithIndex(int index){
    final itemPosition = index++;
    final requestMoreData = itemPosition % 20 == 0 && itemPosition !=0;
    final pageToRequest = itemPosition ~/ 20;
    if(requestMoreData && pageToRequest + 1 >= state.page){
      getProductsFromPage();
    }
  }
}
