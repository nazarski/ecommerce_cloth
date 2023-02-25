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
      additionDate: DateTime.parse(map['additionDate']),
      attributes: map['attributes']['data'].map((e) {
        return e['attributes']['title'] as String;
      }).toList(),
      description: map['description'] ?? '',
      availableQuantity:
          map['availableQuantity'].fold(<String, int>{}, (previousValue, element) {
        previousValue.addAll(<String, int>{element['size']: element['quantity']});
        return previousValue;
      }),
      brand: map['brand']['data']['attributes']['brandName'] as String,
      productType:
          map['productType']['data']['attributes']['typeName'] as String,
      id: map['productId'] as String,
      thumbnail: map['images']['data'].first['attributes']['formats']['small']
          ['url'] as String,
      images: map['images']['data'].map((e) {
        return e['attributes']['formats']['large']['url'];
      }).toList(),
      name: map['productTitle'] ?? '',
      popular: map['popular'] as bool,
      price: map['price'] as int,
      rating: map['rating']??{},
      sale: map['sale']['data'] != null
          ? {
              'title': map['sale']['data']['attributes']['title'],
              'discount': map['sale']['data']['attributes']['discount']
            }
          : {},
    );
  }
}
