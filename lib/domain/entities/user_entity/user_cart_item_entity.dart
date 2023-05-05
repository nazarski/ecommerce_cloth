import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class UserCartItemEntity extends Equatable {
  final DateTime additionDate;
  final ProductEntity product;
  final int quantity;
  final String size;
  final int id;

  const UserCartItemEntity({
    required this.id,
    required this.additionDate,
    required this.product,
    this.quantity = 1,
    this.size = '',
  });

  @override
  List<Object?> get props => [
        id,
        additionDate,
        product,
        quantity,
        size,
      ];

  UserCartItemEntity copyWith({
    DateTime? additionDate,
    ProductEntity? product,
    int? quantity,
    String? size,
    int? id,
  }) {
    return UserCartItemEntity(
      id: id ?? this.id,
      additionDate: additionDate ?? this.additionDate,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
    );
  }
}
