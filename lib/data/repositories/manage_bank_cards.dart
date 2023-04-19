import 'dart:developer';

import 'package:ecommerce_cloth/data/data_sources/local/manage_bank_card_data.dart';
import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_bank_card_repository.dart';

class ManageBankCardsRepositoryImpl implements ManageBankCardRepository {
  @override
  Future<void> addNewCard({required List<CardEntity> card}) async {
    try {
      final cardModels = card.map((entity) => CardModel.fromEntity(entity: entity));
      await ManageBankCardData.addNewCard(cards: cardModels.toList());
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Future<List<CardEntity>> getAllCards() async {
    try {
      final listOfBankCards = await ManageBankCardData.getAllCards();
      return listOfBankCards.map((model) => model.toEntity()).toList();
    } catch (error) {
      log(error.toString());
      return [];
    }
  }
}
