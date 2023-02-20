import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_cloth/data/models/product_model/product_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ManageProductsData {
  ManageProductsData._();

  static final _productsCollection =
      FirebaseFirestore.instance.collection('products');

  static Future<List<ProductModel>> fetchNewProducts() async {
    final startDate = DateTime.now().subtract(const Duration(days: 7));
    return await _productsCollection
        .where('additionDate', isGreaterThanOrEqualTo: startDate)
        .limit(10)
        .get()
        .then((value) {
      return value.docs
          .map(
            (e) => ProductModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    });
  }

  static Future<void> addNewProduct({
    required DateTime additionDate,
    required List<String> attributes,
    required Map<String, int> availableQuantity,
    required String brand,
    required String category,
    required String subcategory,
    required String id,
    required List<String> images,
    required String name,
    required bool popular,
    required int price,
    required Map<String, dynamic> rating,
    required Map<String, dynamic> sale,
}) async {
    await _productsCollection.add(ProductModel(
            additionDate: additionDate,
            attributes: attributes,
            availableQuantity: availableQuantity,
            brand: brand,
            category: category,
            subcategory: subcategory,
            id: id,
            images: images,
            name: name,
            popular: popular,
            price: price,
            rating: rating,
            sale: sale)
        .toMap()).whenComplete(() => print('Product added'));
  }
}
