import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';

abstract class ManageBankCardRepository {

  Future<List<CardEntity>> getAllCards();

  Future<void> addNewCard({required List<CardEntity> card});

}