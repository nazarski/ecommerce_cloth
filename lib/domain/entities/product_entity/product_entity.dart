import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final DateTime additionDate;
  final List<String> attributes;
  final Map<String, int> availableQuantity;
  final String brand;
  final String category;
  final String subcategory;
  // final List<String> favorites;
  final String id;
  final List<String> images;
  final String name;
  final bool popular;
  final int price;
  final Map<String, dynamic> rating;
  final Map<String, dynamic> sale;

  const ProductEntity({
    required this.additionDate,
    required this.attributes,
    required this.availableQuantity,
    required this.brand,
    required this.category,
    required this.subcategory,
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
        category,
        subcategory,
        id,
        images,
        name,
        popular,
        price,
        rating,
        sale,
      ];
}
