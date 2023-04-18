import 'package:ecommerce_cloth/domain/entities/product_entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class UserCartItemEntity extends Equatable{
  final DateTime additionDate;
  final ProductEntity product;
  final int quantity;
  final String size;

  const UserCartItemEntity({
    required this.additionDate,
    required this.product,
    required this.quantity,
    required this.size,
  });

  @override
  List<Object> get props => [
   additionDate,
   product,
   quantity,
   size,
  ];


}