import 'package:equatable/equatable.dart';

class UserCartItemEntity extends Equatable{
  final int additionDate;
  final String product;
  final String productImage;
  final int price;
  final int totalAmount;
  final String productTitle;
  final int quantity;
  final String size;

  const UserCartItemEntity({
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
  // TODO: implement props
  List<Object?> get props => [
   additionDate,
   product,
   productImage,
   price,
   totalAmount,
   productTitle,
   quantity,
   size,
  ];


}