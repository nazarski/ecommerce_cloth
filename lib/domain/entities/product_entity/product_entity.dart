import 'package:ecommerce_cloth/domain/entities/rating_entity/rating_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final DateTime additionDate;
  final List<String> attributes;
  final Map<String, int> availableQuantity;
  final String brand;
  final String productType;
  final String description;
  final List<String> colors;

  // final List<String> favorites;
  final String thumbnail;
  final String id;
  final List<String> images;
  final String name;
  final bool popular;
  final int price;
  final RatingEntity rating;
  final Map<String, dynamic> sale;

  const ProductEntity({
    required this.colors,
    required this.additionDate,
    required this.attributes,
    required this.availableQuantity,
    required this.brand,
    required this.productType,
    required this.thumbnail,
    required this.description,
    required this.id,
    required this.images,
    required this.name,
    required this.popular,
    required this.price,
    required this.rating,
    required this.sale,
  });

  @override
  List<Object> get props => [
        additionDate,
        attributes,
        availableQuantity,
        brand,
        productType,
        thumbnail,
        id,
        images,
        name,
        popular,
        price,
        rating,
        sale,
        description,
        colors,
      ];
}
