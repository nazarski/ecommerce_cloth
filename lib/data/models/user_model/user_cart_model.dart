class UserCartModel{
  final int additionDate;
  final String product;
  final String productImage;
  final int price;
  final int totalAmount;
  final String productTitle;
  final int quantity;
  final String size;

//<editor-fold desc="Data Methods">
  const UserCartModel({
    required this.additionDate,
    required this.product,
    required this.productImage,
    required this.price,
    required this.totalAmount,
    required this.productTitle,
    required this.quantity,
    required this.size,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserCartModel &&
          runtimeType == other.runtimeType &&
          additionDate == other.additionDate &&
          product == other.product &&
          productImage == other.productImage &&
          price == other.price &&
          totalAmount == other.totalAmount &&
          productTitle == other.productTitle &&
          quantity == other.quantity &&
          size == other.size);

  @override
  int get hashCode =>
      additionDate.hashCode ^
      product.hashCode ^
      productImage.hashCode ^
      price.hashCode ^
      totalAmount.hashCode ^
      productTitle.hashCode ^
      quantity.hashCode ^
      size.hashCode;

  @override
  String toString() {
    return 'UserCartModel{'
        'additionDate: $additionDate, '
        'product: $product, '
        'productImage: $productImage, '
        'price: $price, '
        'totalAmount: $totalAmount, '
        'productTitle: $productTitle, '
        'quantity: $quantity, '
        'size: $size,'
        '}';
  }

  UserCartModel copyWith({
    int? additionDate,
    String? product,
    String? productImage,
    int? price,
    int? totalAmount,
    String? productTitle,
    int? quantity,
    String? size,
  }) {
    return UserCartModel(
      additionDate: additionDate ?? this.additionDate,
      product: product ?? this.product,
      productImage: productImage ?? this.productImage,
      price: price ?? this.price,
      totalAmount: totalAmount ?? this.totalAmount,
      productTitle: productTitle ?? this.productTitle,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'additionDate': additionDate,
      'product': product,
      'productImage': productImage,
      'price': price,
      'totalAmount': totalAmount,
      'productTitle': productTitle,
      'quantity': quantity,
      'size': size,
    };
  }

  factory UserCartModel.fromMap(Map<String, dynamic> map) {
    return UserCartModel(
      additionDate: map['additionDate'] as int,
      product: map['product'] as String,
      productImage: map['productImage'] as String,
      price: map['price'] as int,
      totalAmount: map['totalAmount'] as int,
      productTitle: map['productTitle'] as String,
      quantity: map['quantity'] as int,
      size: map['size'] as String,
    );
  }

//</editor-fold>
}