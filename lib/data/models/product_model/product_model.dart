import 'dart:developer';

import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';

class ProductModel {
  final DateTime additionDate;
  final List attributes;
  final Map<String, int> availableQuantity;
  final String brand;
  final String productType;
  final String description;
  final String thumbnail;

  // final List<String> favorites;
  final String id;
  final List images;
  final String name;
  final bool popular;
  final int price;
  final Map<String, dynamic> rating;
  final Map<String, dynamic> sale;

  const ProductModel({
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
  String toString() {
    return '\nProductModel{'
        '\nadditionDate: $additionDate'
        '\nattributes: $attributes, '
        '\navailableQuantity: $availableQuantity, '
        '\nbrand: $brand, '
        '\nproductType: $productType, '
        '\ndescription: $description, '
        '\nthumbnail: $thumbnail,'
        '\nid: $id, '
        '\nimages: $images, '
        '\nname: $name, '
        '\npopular: $popular, '
        '\nprice: $price, '
        '\nrating: $rating, '
        '\nsale: $sale,'
        '}';
  }

  ProductEntity toEntity() {
    return ProductEntity(
      additionDate: additionDate,
      description: description,
      attributes: List<String>.from(attributes),
      availableQuantity: availableQuantity,
      brand: brand,
      productType: productType,
      thumbnail: thumbnail,
      id: id,
      images: List<String>.from(images),
      name: name,
      popular: popular,
      price: price,
      rating: rating,
      sale: sale,
    );
  }

  factory ProductModel.fromEntity({required ProductEntity entity}) {
    return ProductModel(
      additionDate: entity.additionDate,
      attributes: entity.attributes,
      availableQuantity: entity.availableQuantity,
      description: entity.description,
      brand: entity.brand,
      productType: entity.productType,
      id: entity.id,
      thumbnail: entity.thumbnail,
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
      'additionDate': additionDate,
      'attributes': attributes,
      'availableQuantity': availableQuantity,
      'brand': brand,
      'productType': productType,
      'id': id,
      'images': images,
      'name': name,
      'popular': popular,
      'thumbnail': thumbnail,
      'price': price,
      'rating': rating,
      'sale': sale,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map['productId'],
        additionDate: DateTime.tryParse(map['additionDate']) ?? DateTime.now(),
        popular: map['popular'],
        name: map['productTitle'] ?? '',
        price: map['price'],
        description: map['description'] ?? '',
        images: (map['images']['data'] as List).map((image) {
          return image['attributes']['formats']['large']['url'];

        }).toList(),
        availableQuantity: (map['availableQuantity'] as List)
            .fold(<String, int>{}, (previousValue, element) {
          previousValue.addAll({element['size'] : element['quantity']});
          return previousValue;
        }),
        productType: map['productType']['data']['attributes']['typeName'],
        brand: map['brand']['data']['attributes']['brandName'],
        attributes: (map['attributes']['data'] as List).map((element){
          return element['attributes']['title'];
        }).toList(),
        thumbnail: map['images']['data'].first['attributes']['formats']['small']['url'],
        rating: {},
        sale: {});
  }
}
