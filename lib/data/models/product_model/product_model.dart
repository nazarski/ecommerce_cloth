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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModel &&
          runtimeType == other.runtimeType &&
          attributes == other.attributes &&
          availableQuantity == other.availableQuantity &&
          brand == other.brand &&
          category == other.category &&
          subcategory == other.subcategory &&
          id == other.id &&
          images == other.images &&
          name == other.name &&
          popular == other.popular &&
          price == other.price &&
          rating == other.rating &&
          sale == other.sale);

  @override
  int get hashCode =>
      attributes.hashCode ^
      availableQuantity.hashCode ^
      brand.hashCode ^
      category.hashCode ^
      subcategory.hashCode ^
      id.hashCode ^
      images.hashCode ^
      name.hashCode ^
      popular.hashCode ^
      price.hashCode ^
      rating.hashCode ^
      sale.hashCode;

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

  ProductModel copyWith({
    List<String>? attributes,
    Map<String, int>? availableQuantity,
    String? brand,
    String? category,
    String? subcategory,
    String? id,
    List<String>? images,
    String? name,
    bool? popular,
    int? price,
    Map<String, dynamic>? rating,
    Map<String, dynamic>? sale,
  }) {
    return ProductModel(
      attributes: attributes ?? this.attributes,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      popular: popular ?? this.popular,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      sale: sale ?? this.sale,
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
