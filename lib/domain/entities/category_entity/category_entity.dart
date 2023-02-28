import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String categoryTitle;
  final String categoryId;
  final String categoryImage;

  const CategoryEntity({
    required this.categoryTitle,
    required this.categoryId,
    required this.categoryImage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoryTitle,
        categoryId,
        categoryImage,
      ];
}
