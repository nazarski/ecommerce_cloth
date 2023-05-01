import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_cloth/data/models/card_model/card_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ManageBankCardData {
  ManageBankCardData._();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const _storageKey = 'cards';

  static Future<List<CardModel>> getAllCards() async {
    final String json = await _secureStorage.read(key: _storageKey) ?? '[]';
    final allCards = List<Map<String, dynamic>>.from(jsonDecode(json));
    log(allCards.toString());
    return allCards.map((e) => CardModel.fromMap(e)).toList();
  }

  static Future<void> saveCard(List<CardModel> cards) async {
    final String json = jsonEncode(cards.map((e) => e.toMap()).toList());
    await _secureStorage.write(key: _storageKey, value: json);
  }

  static Future<void> addNewCard({required List<CardModel> cards}) async {
    await saveCard(cards);
  }
}
