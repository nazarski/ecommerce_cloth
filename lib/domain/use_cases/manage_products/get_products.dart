import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:ecommerce_cloth/data/repositories/manare_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_products_repository.dart';
import 'package:ecommerce_cloth/presentation/pages/home_page/widgets/product_slider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetProducts {
  final ManageProductsRepository _productsRepository;

  GetProducts(this._productsRepository);

  Future<List<ProductEntity>> _getNewProducts() async {
    final DateTime weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return await _productsRepository.getProductsFromDate(weekAgo);
  }
  Future<List<ProductEntity>> _getSaleProducts() async {
    final DateTime weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return await _productsRepository.getProductsFromDate(weekAgo);
  }
  Future<List<ProductEntity>> _getHotProducts() async {
    final DateTime weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return await _productsRepository.getProductsFromDate(weekAgo);
  }
  Future<List<ProductEntity>> getByType(ProductSliderType type)async{
    // await Future.delayed(Duration(seconds: 3),(){
    //   print('shimmer');
    // });
    switch(type){
      case ProductSliderType.newProducts:
        return await _getNewProducts();
      case ProductSliderType.sale:
        return await _getHotProducts();
      case ProductSliderType.hot:
        return await _getSaleProducts();
    }
  }
}
