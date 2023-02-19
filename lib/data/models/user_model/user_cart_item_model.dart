class UserCartItemModel{
  final int additionDate;
  final String product;
  final String productImage;
  final int price;
  final int totalAmount;
  final String productTitle;
  final int quantity;
  final String size;

  const UserCartItemModel({
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

  UserCartItemModel copyWith({
    int? additionDate,
    String? product,
    String? productImage,
    int? price,
    int? totalAmount,
    String? productTitle,
    int? quantity,
    String? size,
  }) {
    return UserCartItemModel(
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

  factory UserCartItemModel.fromMap(Map<String, dynamic> map) {
    return UserCartItemModel(
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