import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';

class UserCartItemModel {
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

  UserCartItemEntity toEntity() {
    return UserCartItemEntity(
      additionDate: additionDate,
      product: product,
      productImage: productImage,
      price: price,
      totalAmount: totalAmount,
      productTitle: productTitle,
      quantity: quantity,
      size: size,
    );
  }

  factory UserCartItemModel.fromEntity({required UserCartItemEntity entity}) {
    return UserCartItemModel(
      additionDate: entity.additionDate,
      product: entity.product,
      productImage: entity.productImage,
      price: entity.price,
      totalAmount: entity.totalAmount,
      productTitle: entity.productTitle,
      quantity: entity.quantity,
      size: entity.size,
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
}
