import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final int cardNumber;
  final String cardDate;
  final String cardName;
  final bool isDefault;
  final String cardId;

  const CardEntity({
    this.cardId = '',
    this.cardNumber = -1,
    this.cardDate = '',
    this.cardName = '',
    this.isDefault = false,
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

  String get cardIcon => _getCardTypeIcon(cardNumber.toString());

  String _getCardTypeIcon(String cardNumber) {
    final RegExp visaRegex = RegExp(r'^4[0-9]{6,}$');
    final RegExp mastercardRegex = RegExp(r'^5[1-5][0-9]{5,}$');
    final RegExp amexRegex = RegExp(r'^3[47][0-9]{5,}$');

    String iconPath = '';

    if (visaRegex.hasMatch(cardNumber)) {
      iconPath = AppIcons.visa;
    } else if (mastercardRegex.hasMatch(cardNumber)) {
      iconPath = AppIcons.masterCard;
    } else if (amexRegex.hasMatch(cardNumber)) {
      iconPath = AppIcons.americanExpress;
    } else {
      iconPath = AppIcons.defaultCard;
    }

    return iconPath;
  }
}
