import 'dart:developer';

import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_bank_card/manage_bank_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manageBankCard = ManageBankCard();

final bankCardsProvider =
    StateNotifierProvider<BankCardsProvider, AsyncValue<List<CardEntity>>>((ref) => BankCardsProvider());

class BankCardsProvider extends StateNotifier<AsyncValue<List<CardEntity>>> {
  BankCardsProvider() : super(const AsyncLoading()){_getAllCards();}

  Future<void> _getAllCards() async {
    try {
      final List<CardEntity> allCards = await manageBankCard.getAllCards();
      state = AsyncData(allCards);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      log(e.toString());
    }
  }

  Future<void> addNewCard({required CardEntity newCard}) async {

    await manageBankCard.addNewCards(allCards: state.value ?? [], newCard: newCard);
    state = const AsyncLoading();
    await _getAllCards();
  }
  Future<void> makeToDefault({required CardEntity makeDefault}) async {
    state = AsyncData(state.value!..remove(makeDefault));
    await addNewCard(newCard: makeDefault.copyWith(isDefault: true));

  }

}
