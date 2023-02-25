import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_products_repository.dart';

class GetProducts {
  final ManageProductsRepository _productsRepository;

  GetProducts(this._productsRepository);

  Future<List<ProductEntity>> getNewProducts()async{
    final DateTime weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return await _productsRepository.getProductsFromDate(weekAgo);
  }

}