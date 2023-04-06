
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/rating_model/rating_model.dart';
import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';

class ProductModel {
  final DateTime additionDate;
  final Iterable attributes;
  final Map<String, int> availableQuantity;
  final String brand;
  final String productType;
  final String description;
  final String thumbnail;
  final int systemId;

  // final List<String> favorites;
  final String id;
  final Iterable images;
  final String name;
  final bool popular;
  final int price;
  final Iterable colors;
  final RatingModel rating;
  final Map<String, dynamic> sale;

  const ProductModel({
    required this.systemId,
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
        '\nsale: $colors,'
        '}';
  }

  ProductEntity toEntity() {
    return ProductEntity(
      systemId: systemId,
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
      rating: rating.toEntity(),
      sale: sale,
      colors: List<String>.from(colors),
    );
  }

  factory ProductModel.fromEntity({required ProductEntity entity}) {
    return ProductModel(
      systemId: entity.systemId,
      colors: entity.colors,
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
      rating: RatingModel.fromEntity(entity: entity.rating),
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
      'colors': colors,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        systemId: map['id'],
        id: map['attributes']['productId'],
        additionDate: DateTime.tryParse(map['attributes']['additionDate']) ??
            DateTime.now(),
        popular: map['attributes']['popular'],
        name: map['attributes']['productTitle'] ?? '',
        price: map['attributes']['price'],
        description: map['attributes']['description'] ?? '',
        images: (map['attributes']['images']['data'] as List).map((image) {
          return StrapiInitialize.endpoint +
              image['attributes']['formats']['large']['url'];
        }),
        availableQuantity: (map['attributes']['availableQuantity'] as List)
            .fold(<String, int>{}, (previousValue, element) {
          previousValue.addAll({element['size']: element['quantity']});
          return previousValue;
        }),
        productType: map['attributes']['productType']['data']['attributes']
            ['typeName'],
        brand: map['attributes']['brand']['data']['attributes']['brandName'],
        attributes:
            (map['attributes']['attributes']['data'] as List).map((element) {
          return element['attributes']['title'];
        }),
        thumbnail: StrapiInitialize.endpoint +
            map['attributes']['images']['data'].first['attributes']['formats']
                ['small']['url'],
        colors: map['attributes']['color'].map((e) => e['color']),
        rating: RatingModel.fromMap(map['attributes']['rating']),
        sale: {});
  }
}
