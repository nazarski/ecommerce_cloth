import 'package:ecommerce_cloth/data/models/product_model/product_model.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_cart_item_entity.dart';

class UserCartItemModel {
  final DateTime additionDate;
  final ProductModel product;
  final int quantity;
  final String size;
  final int id;

  const UserCartItemModel({
    required this.id,
    required this.additionDate,
    required this.product,
    required this.quantity,
    required this.size,
  });

  @override
  String toString() {
    return 'UserCartModel{'
        'additionDate: $additionDate, '
        'product: $product, '
        'quantity: $quantity, '
        'size: $size,'
        '}';
  }

  UserCartItemEntity toEntity() {
    return UserCartItemEntity(
      additionDate: additionDate,
      product: product.toEntity(),
      quantity: quantity,
      size: size,
      id: id,
    );
  }

  factory UserCartItemModel.fromEntity({required UserCartItemEntity entity}) {
    return UserCartItemModel(
      id: entity.id,
      additionDate: entity.additionDate,
      product: ProductModel.fromEntity(entity: entity.product),
      quantity: entity.quantity,
      size: entity.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'additionDate': additionDate.toIso8601String(),
      'product': product.toMap(),
      'quantity': quantity,
      'size': size,
    };
  }

  factory UserCartItemModel.fromMap(Map<String, dynamic> map) {
    return UserCartItemModel(
      id: map['id'] as int,
      additionDate: DateTime.parse(map['createdAt']),
      product: ProductModel.fromCartItemMap(map['product']),
      quantity: map['quantity'] ?? 0,
      size: map['size'] as String,
    );
  }
  factory UserCartItemModel.fromOrderMap(Map<String, dynamic> map) {
    return UserCartItemModel(
      id: map['id'] as int,
      additionDate: DateTime.parse(map['additionDate']),
      product: ProductModel.fromOrderMap(map['product']),
      quantity: map['quantity'] as int,
      size: map['size'] as String,
    );
  }
}
