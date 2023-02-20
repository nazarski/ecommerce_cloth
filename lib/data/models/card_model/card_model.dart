import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';

class CardModel {
  final int cardNumber;
  final int cardDate;
  final int cvvCode;
  final String cardType;
  final String cardIcon;

  const CardModel({
    required this.cardNumber,
    required this.cardDate,
    required this.cvvCode,
    required this.cardType,
    required this.cardIcon,
  });

  @override
  String toString() {
    return 'CardModel{ '
        'cardNumber: $cardNumber, '
        'cardDate: $cardDate, '
        'cvvCode: $cvvCode, '
        'cardType: $cardType, '
        'cardIcon: $cardIcon,}';
  }

  CardEntity toEntity() {
    return CardEntity(
        cardNumber: cardNumber,
        cardDate: cardDate,
        cvvCode: cvvCode,
        cardType: cardType,
        cardIcon: cardIcon);
  }

  factory CardModel.fromEntity({required CardEntity entity}) {
    return CardModel(
        cardNumber: entity.cardNumber,
        cardDate: entity.cardDate,
        cvvCode: entity.cvvCode,
        cardType: entity.cardType,
        cardIcon: entity.cardIcon);
  }


  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'cardDate': cardDate,
      'cvvCode': cvvCode,
      'cardType': cardType,
      'cardIcon': cardIcon,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardNumber: map['cardNumber'] as int,
      cardDate: map['cardDate'] as int,
      cvvCode: map['cvvCode'] as int,
      cardType: map['cardType'] as String,
      cardIcon: map['cardIcon'] as String,
    );
  }
}
