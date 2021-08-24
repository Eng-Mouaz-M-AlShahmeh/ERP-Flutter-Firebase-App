import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/product_model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  // update user data
  Future updateUserData(String? email, Timestamp timeRegistered) async {
    return usersCollection.doc(uid).set({
      'email': email,
      'timeRegistered': timeRegistered,
    });
  }

  // update product data
  Future updateProductData(
      String? title, double? price, int? quantity, Timestamp timeAdded) async {
    return productsCollection.doc(productsCollection.doc().id).set({
      'title': title,
      'price': price,
      'quantity': quantity,
      'timeAdded': timeAdded,
    });
  }

  // product list from snapshot
  List<ProductModel> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => ProductModel(
              title: doc['title'] ?? '',
              price: doc['price'] ?? 0.0,
              quantity: doc['quantity'] ?? 0,
              timeAdded: doc['timeAdded'] ?? null,
            ))
        .toList();
  }

  // get users stream
  Stream<QuerySnapshot> get users {
    return usersCollection.snapshots();
  }

  // get products stream
  Stream<List<ProductModel>> get products {
    return productsCollection
        .snapshots()
        .map((e) => _productListFromSnapshot(e));
  }
}
