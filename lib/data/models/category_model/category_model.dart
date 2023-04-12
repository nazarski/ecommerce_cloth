import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/category_entity/category_entity.dart';

class CategoryModel {
  final String categoryTitle;
  final String categoryId;
  final String categoryImage;

  const CategoryModel({
    required this.categoryTitle,
    required this.categoryId,
    required this.categoryImage,
  });

  @override
  String toString() {
    return 'CardModel{ '
        'categoryTitle: $categoryTitle, '
        'categoryId: $categoryId, '
        'categoryImage: $categoryImage,';
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryTitle: categoryTitle,
      categoryId: categoryId,
      categoryImage: categoryImage,
    );
  }

  factory CategoryModel.fromEntity({required CategoryEntity entity}) {
    return CategoryModel(
      categoryTitle: entity.categoryTitle,
      categoryId: entity.categoryId,
      categoryImage: entity.categoryImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryTitle': categoryTitle,
      'categoryId': categoryId,
      'categoryImage': categoryImage,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryTitle: map['categoryTitle'] as String,
      categoryId: map['categoryId'] as String,
      categoryImage:
          map['categoryImage']['data']['attributes']['formats']['small'] != null
              ? StrapiInitialize.endpoint +
                  map['categoryImage']['data']['attributes']['formats']['small']
                      ['url']
              : StrapiInitialize.endpoint +
                  map['categoryImage']['data']['attributes']['url'],
    );
  }
}
