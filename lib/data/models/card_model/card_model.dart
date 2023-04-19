import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';

class CardModel {
  final int cardNumber;
  final String cardDate;
  final String cardName;
  final bool isDefault;
  final String cardId;

  const CardModel({
    required this.cardNumber,
    required this.cardDate,
    required this.cardName,
    required this.isDefault,
    required this.cardId,
  });

  @override
  String toString() {
    return 'CardModel{ '
        'cardNumber: $cardNumber, '
        'cardDate: $cardDate, '
        'cardId: $cardId,'
        'cardType: $cardName, '
        'isDefault: $isDefault';
  }

  CardEntity toEntity() {
    return CardEntity(
      isDefault: isDefault,
      cardNumber: cardNumber,
      cardDate: cardDate,
      cardName: cardName,
      cardId: cardId,
    );
  }

  factory CardModel.fromEntity({required CardEntity entity}) {
    return CardModel(
      cardId: entity.cardId,
      cardNumber: entity.cardNumber,
      cardDate: entity.cardDate,
      cardName: entity.cardName,
      isDefault: entity.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cardId': cardId,
      'cardNumber': cardNumber,
      'cardDate': cardDate,
      'cardName': cardName,
      'isDefault': isDefault,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardId: map['cardId'] as String,
      isDefault: map['isDefault'] as bool,
      cardNumber: map['cardNumber'] as int,
      cardDate: map['cardDate'] as String,
      cardName: map['cardName'] as String,
    );
  }
}
