import 'package:ecommerce_cloth/data/repositories/manare_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_products/get_products.dart';

const getProducts = GetProducts(ManageProductsRepositoryImpl());
