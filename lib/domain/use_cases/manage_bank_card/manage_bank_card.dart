import 'package:ecommerce_cloth/data/repositories/manage_bank_cards.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_bank_card_repository.dart';

class ManageBankCard {
  final ManageBankCardRepository _manageBankCardRepository =
      ManageBankCardsRepositoryImpl();
  Future<void> addNewCards({
    required List<CardEntity> allCards,
    required CardEntity newCard,
  }) async {
    if (newCard.isDefault) {
      allCards.map((e) => e.copyWith(isDefault: false));
    }
    if (allCards.isEmpty && !newCard.isDefault) {
      newCard.copyWith(isDefault: true);
    }
    allCards.add(newCard);
    await _manageBankCardRepository.addNewCard(card: allCards);
  }

  Future<List<CardEntity>> getAllCards() async {
    final List<CardEntity> allCards =
        await _manageBankCardRepository.getAllCards();
    allCards.sort((a, b) {
      if (b.isDefault) return 1;
      return -1;
    });
    return allCards;
  }
}
