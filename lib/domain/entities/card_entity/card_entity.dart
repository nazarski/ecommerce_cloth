import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final int cardNumber;
  final String cardDate;
  final String cardName;
  final bool isDefault;
  final String cardId;

  const CardEntity({
    required this.cardId,
    required this.cardNumber,
    required this.cardDate,
    required this.cardName,
    required this.isDefault,
  });

  @override
  List<Object?> get props => [
        cardId,
        cardNumber,
        cardDate,
        cardName,
        isDefault,
      ];

  CardEntity copyWith({
    int? cardNumber,
    String? cardDate,
    String? cardName,
    bool? isDefault,
    String? cardId,
  }) {
    return CardEntity(
      cardNumber: cardNumber ?? this.cardNumber,
      cardDate: cardDate ?? this.cardDate,
      cardName: cardName ?? this.cardName,
      isDefault: isDefault ?? this.isDefault,
      cardId: cardId ?? this.cardId,
    );
  }
}
