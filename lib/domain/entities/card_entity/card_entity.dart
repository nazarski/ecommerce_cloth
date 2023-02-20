import 'package:equatable/equatable.dart';

class CardEntity extends Equatable{
  final int cardNumber;
  final int cardDate;
  final int cvvCode;
  final String cardType;
  final String cardIcon;

  const CardEntity({
    required this.cardNumber,
    required this.cardDate,
    required this.cvvCode,
    required this.cardType,
    required this.cardIcon,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    cardNumber,
    cardDate,
    cvvCode,
    cardType,
    cardIcon,
  ];

}