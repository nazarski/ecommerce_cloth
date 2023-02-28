
import 'package:ecommerce_cloth/domain/entities/category_entity/category_entity.dart';

abstract class ManageCategoriesRepository{
  Future<List<CategoryEntity>> getCategoriesFromAttribute(String attribute);

}