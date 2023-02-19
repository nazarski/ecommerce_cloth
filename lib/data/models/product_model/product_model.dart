import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';

class ProductModel {
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

  const ProductModel({
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
  String toString() {
    return 'ProductModel { '
        'attributes: $attributes, '
        'availableQuantity: $availableQuantity, '
        'brand: $brand, '
        'category: $category, '
        'subcategory: $subcategory, '
        'id: $id, '
        'images: $images, '
        'name: $name, '
        'popular: $popular, '
        'price: $price, '
        'rating: $rating, '
        'sale: $sale,'
        '}';
  }

  ProductEntity toEntity() {
    return ProductEntity(
      attributes: attributes,
      availableQuantity: availableQuantity,
      brand: brand,
      category: category,
      subcategory: subcategory,
      id: id,
      images: images,
      name: name,
      popular: popular,
      price: price,
      rating: rating,
      sale: sale,
    );
  }

  factory ProductModel.fromEntity({required ProductEntity entity}) {
    return ProductModel(
      attributes: entity.attributes,
      availableQuantity: entity.availableQuantity,
      brand: entity.brand,
      category: entity.category,
      subcategory: entity.subcategory,
      id: entity.id,
      images: entity.images,
      name: entity.name,
      popular: entity.popular,
      price: entity.price,
      rating: entity.rating,
      sale: entity.sale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'attributes': attributes,
      'availableQuantity': availableQuantity,
      'brand': brand,
      'category': category,
      'subcategory': subcategory,
      'id': id,
      'images': images,
      'name': name,
      'popular': popular,
      'price': price,
      'rating': rating,
      'sale': sale,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      attributes: map['attributes'] as List<String>,
      availableQuantity: map['availableQuantity'] as Map<String, int>,
      brand: map['brand'] as String,
      category: map['category'] as String,
      subcategory: map['subcategory'] as String,
      id: map['id'] as String,
      images: map['images'] as List<String>,
      name: map['name'] as String,
      popular: map['popular'] as bool,
      price: map['price'] as int,
      rating: map['rating'] as Map<String, dynamic>,
      sale: map['sale'] as Map<String, dynamic>,
    );
  }
}
